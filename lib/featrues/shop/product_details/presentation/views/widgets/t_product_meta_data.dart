import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/images/t_circular_image.dart';
import 'package:t_store/common_widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:t_store/common_widgets/texts/t_product_price_text.dart';
import 'package:t_store/common_widgets/texts/t_product_title_text.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/enums.dart';
import 'package:t_store/core/constants/image_strings.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radius: 8,
              backGroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              child: Text("25%", style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
            ),
            const SizedBox(width: 16,),
            Text("\$250",style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            const SizedBox(width: 16,),
            const TProductPriceText(price: "175",isLarge: true,),
          ],
        ),
        const SizedBox(height: 10.5,),
        const TProductTitleText(title: "Green Nike Sport Shoes"),
        const SizedBox(height: 10.5,),

        Row(
          children: [
            const TProductTitleText(title: "Status"),
            const SizedBox(width: 16,),
            Text("In Stock",style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        const SizedBox(height: 10.5,),
        Row(
          children: [
            TCircularImage(
              image: TImages.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: isDarkMode? TColors.white:TColors.black,
            ),
            const SizedBox(width: 4,),
            const TBrandTitleWithVerifiedIcon(title: "Nike",brandTextSize: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
