import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/checkout/model/payment_method_model.dart';
import 'package:t_store/features/shop/checkout/presentation/views_model/checkout_controller.dart';

class TPaymentTile extends StatelessWidget {
  const TPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;

  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: (){
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: TRoundedContainer(
        width: 60,
        height: 40,
        backGroundColor: Theme.of(context).brightness == Brightness.dark? TColors.light : TColors.white,
        padding: const EdgeInsets.all(8),
        child: Image.asset(paymentMethod.image,fit: BoxFit.contain,),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_copy),
    );
  }
}
