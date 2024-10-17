import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/images/t_circular_image.dart';
import 'package:t_store/common_widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/enums.dart';
import 'package:t_store/features/shop/all_brands/model/brand_model.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    required this.showBorder,
    this.onTap,
    required this.brandData,
  });
  final bool showBorder;
  final void Function()? onTap;
  final BrandModel brandData;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(8),
        backGroundColor: Colors.transparent,
        showBorder: showBorder,
        child: Row(
          children: [
             Flexible(
              child:  TCircularImage(
                fit: BoxFit.fitWidth,
                isNetworkImage: true,
                image: brandData.image,
                backgroundColor: isDarkMode ? TColors.light :Colors.transparent,
              ),
            ),
            const SizedBox(width: 8,),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(title: brandData.name,brandTextSize: TextSizes.large,),
                  Text(
                    "${brandData.productsCount} products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
