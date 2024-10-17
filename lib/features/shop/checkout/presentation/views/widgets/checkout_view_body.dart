import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/cart/presentation/views/widgets/t_cart_items.dart';
import 'package:t_store/features/shop/checkout/presentation/views/widgets/t_billing_address_section.dart';
import 'package:t_store/features/shop/checkout/presentation/views/widgets/t_billing_amount_section.dart';
import 'package:t_store/features/shop/checkout/presentation/views/widgets/t_billing_payment_section.dart';
import 'package:t_store/features/shop/checkout/presentation/views/widgets/t_coupon_code.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding:EdgeInsets.only(
        right: MediaQuery.sizeOf(context).width*0.0611,
        left: MediaQuery.sizeOf(context).width*0.0611,
        top: MediaQuery.sizeOf(context).height*0.0280,
        bottom: MediaQuery.sizeOf(context).height*0.0280,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const TCartItems(showAddRemoveButtons: false,),
            const SizedBox(height: 32,),
            const TCouponCode(),
            const SizedBox(height: 32,),

            TRoundedContainer(
              padding: const EdgeInsets.all(16),
              showBorder: true,
              backGroundColor: isDarkMode? TColors.dark: TColors.white,
              child: const Column(
                children: [
                  TBillingAmountSection(),
                  SizedBox(height: 16,),

                  Divider(),
                  SizedBox(height: 16,),

                  TBillingPaymentSection(),
                  SizedBox(height: 16,),

                  TBillingAddressSection(),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}