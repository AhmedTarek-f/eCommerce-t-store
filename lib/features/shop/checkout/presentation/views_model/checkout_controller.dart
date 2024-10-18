import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/shop/checkout/model/payment_method_model.dart';
import 'package:t_store/features/shop/checkout/presentation/views/widgets/t_payment_tile.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;
  final GetStorage _storage = GetStorage();
  @override
  void onInit() {
    selectedPaymentMethod.value = const PaymentMethodModel(image: TImages.paypal, name: "Paypal");
    super.onInit();
  }

  bool isArabic() {
   final String language = _storage.read("lang");
    return language == "ar";
  }

  final List<PaymentMethodModel> _paymentMethodsList =  const [
    PaymentMethodModel(image: TImages.paypal, name: "Paypal"),
    PaymentMethodModel(image: TImages.creditCard, name: "CreditCard"),
    PaymentMethodModel(image: TImages.visa, name: "Visa"),
    PaymentMethodModel(image: TImages.masterCard, name: "MasterCard"),
    PaymentMethodModel(image: TImages.googlePay, name: "GooglePay"),
    PaymentMethodModel(image: TImages.applePay, name: "ApplePay"),
    PaymentMethodModel(image: TImages.payStack, name: "PayStack"),
    PaymentMethodModel(image: TImages.paytm, name: "Paytm"),
  ];

  Future<dynamic> selectPaymentMethod(BuildContext context){
    return showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
          child: Container(
            padding:  const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TSectionHeading(title: "Select Payment Method".tr ,showActionButton: false,),
                const SizedBox(height: 32,),
                Column(
                  children: _paymentMethodsList.map((paymentMethod) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TPaymentTile(paymentMethod: paymentMethod),
                  )).toList(),
                )
              ],
            ),
          ),
        ),
    );
  }
}