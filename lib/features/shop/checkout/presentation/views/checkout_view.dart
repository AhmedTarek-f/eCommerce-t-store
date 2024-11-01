import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/core/helper/pricing_calculator.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/features/personalization/my_orders/presentation/views_model/order_controller.dart';
import 'package:t_store/features/shop/cart/presentation/views_model/cart_controller.dart';
import 'package:t_store/features/shop/checkout/presentation/views/widgets/checkout_view_body.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, "EG");
    final orderController = Get.put(OrderController());
    return  Scaffold(
      appBar: TAppBar(
        title: Text("Order Review".tr,style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body:const CheckoutViewBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 24,left:24 ,bottom: 8),
        child: ElevatedButton(
            onPressed: subTotal >0 ? () async => await orderController.processOrder(totalAmount) : TLoaders.warningSnackBar(title: "The Cart Is Empty".tr, message:"Add items in the cart in order to proceed.".tr),
            child: Text("${"Checkout".tr} \$${totalAmount.toStringAsFixed(1)}"),
        ),
      ),
    );
  }
}

