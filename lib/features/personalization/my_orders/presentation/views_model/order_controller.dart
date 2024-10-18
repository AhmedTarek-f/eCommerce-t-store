import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/common_widgets/success_screen.dart';
import 'package:t_store/core/constants/enums.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/popups/t_full_screen_loader.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/order/order_repository.dart';
import 'package:t_store/features/personalization/my_address/presentation/views_model/address_controller.dart';
import 'package:t_store/features/personalization/my_orders/model/order_model.dart';
import 'package:t_store/features/shop/cart/presentation/views_model/cart_controller.dart';
import 'package:t_store/features/shop/checkout/presentation/views_model/checkout_controller.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views/navigation_menu_view.dart';

class OrderController extends GetxController
{
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final _orderRepository = Get.put(OrderRepository());
  final GetStorage _storage = GetStorage();
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await _orderRepository.fetchUserOrders();
      return userOrders;
    }
    catch(e) {
      TLoaders.errorSnackBar(title: "Oh Snap!".tr,message: e.toString());
      return [];
    }
  }

  bool isArabic() {
    final String language = _storage.read("lang");
    return language == "ar";
  }

  Future<void> processOrder(double totalAmount) async {
    try{
      TFullScreenLoader.openLoadingDialog("Processing your order".tr, TImages.pencilAnimation);

      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) return;

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
      TLoaders.errorSnackBar(title: "Oh Snap!".tr,message: e.toString());
    }
  }

}