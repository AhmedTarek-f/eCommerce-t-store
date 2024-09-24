import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/image_strings.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return  Column(
      children: [
        TSectionHeading(title: "Payment Method",padding:const EdgeInsets.all(0),buttonTitle: "Change",onPressed: (){},),
        const SizedBox(height: 8,),
        Row(
          children: [
            TRoundedContainer(
              width: 60,
              height: 35,
              backGroundColor: isDarkMode? TColors.light : TColors.white,
              padding:  const EdgeInsets.all(8),
              child: Image.asset(TImages.paypal,fit: BoxFit.contain,),
            ),
            const SizedBox(width: 8,),
            Text("Paypal",style: Theme.of(context).textTheme.bodyLarge,)
          ],
        )

      ],
    );
  }
}
