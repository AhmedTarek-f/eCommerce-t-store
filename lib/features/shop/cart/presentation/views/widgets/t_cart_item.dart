import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/common_widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:t_store/common_widgets/texts/t_product_title_text.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/image_strings.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        TRoundedImage(
          imageUrl: TImages.productImage38,
          width: MediaQuery.sizeOf(context).width*0.1527,
          height: MediaQuery.sizeOf(context).height*0.0700,
          padding: const EdgeInsets.all(8),
          backgroundColor: isDarkMode? TColors.darkerGrey: TColors.light,
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: "Nike"),
              const TProductTitleText(title: "Black Sports shoes",maxLines: 1,),
              Text.rich(
                TextSpan(children: [
                  TextSpan(text: "Color ",style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: "Green ",style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: "Color ",style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: "Green ",style: Theme.of(context).textTheme.bodyLarge),
                ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
