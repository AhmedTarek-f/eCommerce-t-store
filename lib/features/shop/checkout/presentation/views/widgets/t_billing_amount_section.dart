import 'package:flutter/material.dart';
import 'package:t_store/core/helper/pricing_calculator.dart';
import 'package:t_store/features/shop/cart/presentation/views_model/cart_controller.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = CartController.instance;
    final double subTotal = cartController.totalCartPrice.value;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Subtotal",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$$subTotal",style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$${TPricingCalculator.calculateShippingCost(subTotal, "EG")}",style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Tax Fee",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$${TPricingCalculator.calculateTax(subTotal, "EG")}",style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: 8,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Order Total",style: Theme.of(context).textTheme.bodyMedium,),
            Text("\$${TPricingCalculator.calculateTotalPrice(subTotal, "EG").toStringAsFixed(1)}",style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
