import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/common_widgets/success_screen.dart';
import 'package:t_store/core/constants/enums.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/popups/t_full_screen_loader.dart';
import 'package:t_store/core/utlis/services/stripe_service/stripe_service.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/order/order_repository.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';
import 'package:t_store/features/personalization/my_address/model/address_model.dart';
import 'package:t_store/features/personalization/my_address/presentation/views_model/address_controller.dart';
import 'package:t_store/features/personalization/my_orders/model/order_model.dart';
import 'package:t_store/features/shop/cart/presentation/views_model/cart_controller.dart';
import 'package:t_store/features/shop/checkout/model/payment_intent_input_model.dart';
import 'package:t_store/features/shop/checkout/presentation/views_model/checkout_controller.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views/navigation_menu_view.dart';

class OrderController extends GetxController
{
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final _orderRepository = Get.put(OrderRepository());
  late final GetStorage _storage;
  late final StripeService stripeService;
  final _userController = UserController.instance;
  final RxBool isCheckoutLoading = false.obs;

  @override
  void onInit() {
    _storage = GetStorage();
    stripeService = StripeService();
    super.onInit();
  }
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await _orderRepository.fetchUserOrders();
      return userOrders;
    }
    catch(e) {
      TLoaders.errorSnackBar(title: "Oh Snap!".tr,message: e.toString().tr);
      return [];
    }
  }

  bool isArabic() {
    final String language = _storage.read("lang");
    return language == "ar";
  }

  Future<void> processOrder(double totalAmount) async {
    try{
      final addressData = addressController.selectedAddress.value;
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final paymentMethodName =checkoutController.selectedPaymentMethod.value.name;
      if(userId.isEmpty) return;
      else if(addressData.selectedAddress == false || addressData.name.isEmpty || addressData.phoneNumber.isEmpty){
        return TLoaders.warningSnackBar(title: "Billing address check!".tr,message: "please check you have provided your billing address.".tr);
      }
      if( paymentMethodName == "CreditCard" || paymentMethodName == "Visa" || paymentMethodName == "MasterCard" ) {
        isCheckoutLoading.value = true;
        await stripeService.makePayment(
            paymentIntentInputModel: PaymentIntentInputModel(
              currency: "usd",
              amount: int.parse(totalAmount.toStringAsFixed(0)),
              customerId: _userController.user.value.stripeId,
            ));
        isCheckoutLoading.value = false;
      }
      if(paymentMethodName == "GooglePay") {
        isCheckoutLoading.value = true;
        await stripeService.makePayment(isGooglePay: true,paymentIntentInputModel: PaymentIntentInputModel(
            currency: "usd",
            amount: int.parse(totalAmount.toStringAsFixed(0)),
            customerId: _userController.user.value.stripeId
        ));
        isCheckoutLoading.value = false;
      }
      TFullScreenLoader.openLoadingDialog("Processing your order".tr, TImages.pencilAnimation);
      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      await _orderRepository.saveOrder(order, userId);

      cartController.clearCart();

      Get.off(() => SuccessScreen(
        image: TImages.orderCompleteAnimation,
        title: "Payment Success!".tr,
        subTitle: "Your item will be shipped soon!".tr,
        isAnimation: true,
        onPressed: () => Get.offAll(() => const NavigationMenuView()),
      )
      );
    }
    catch(e) {
      TLoaders.errorSnackBar(title: "Oh Snap!".tr,message: e.toString().tr);
    }
    finally{
      isCheckoutLoading.value =false;
    }
  }

}