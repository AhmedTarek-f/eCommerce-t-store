import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/choice_chip/t_choice_chip.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/texts/t_product_price_text.dart';
import 'package:t_store/common_widgets/texts/t_product_title_text.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/colors.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TRoundedContainer(
          padding: const EdgeInsets.all(16),
          backGroundColor: isDarkMode?TColors.darkerGrey:TColors.grey,
          child:  Column(
            children: [
              Row(
                children: [
                  const TSectionHeading(title: "Variation",showActionButton: false,padding: EdgeInsets.zero,),
                  const SizedBox(width: 16,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(title: "Price: ",isSmallSize: true,),
                          Text("\$25",style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
                          const SizedBox(width: 16,),
                          const TProductPriceText(price: "20",),
                        ],
                      ),
                      Row(
                        children: [
                          const TProductTitleText(title: "Stock: ",isSmallSize: true,),
                          Text("InStock",style: Theme.of(context).textTheme.titleMedium,),
                        ],
                      ),
                    ],
                  ),

                ],
              ),
              const TProductTitleText(
                title: "This is the Description of the product and it can go up to max 4 lines",
                isSmallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: 16,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: "Colors",showActionButton: false,padding: EdgeInsets.all(0),),
            const SizedBox(height: 10.5,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'green', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'red', selected: false, onSelected: (value){},),
                TChoiceChip(text: 'blue', selected: false, onSelected: (value){},),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16,),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: "Size",showActionButton: false,padding: EdgeInsets.all(0),),
            const SizedBox(height: 10.5,),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'EU 34', selected: true, onSelected: (value){},),
                TChoiceChip(text: 'EU 36', selected: false, onSelected: (value){},),
                TChoiceChip(text: 'EU 38', selected: false, onSelected: (value){},),
              ],
            )
          ],
        ),
      ],
    );
  }
}
