import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/all_brands/model/brand_model.dart';
import 'package:t_store/features/shop/brand_products/presentation/views/brand_products_view.dart';
import 'package:t_store/features/shop/store/presentation/views/widget/t_brand_card.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images, required this.brand,
  });
  final List<String> images;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> Get.to(()=> BrandProductsView(brandData: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backGroundColor: Colors.transparent,
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            TBrandCard(showBorder: false,brandData: brand,),
            const SizedBox(height: 16,),
            Row(
              children: images.map((image) => brandTopProductImageWidget(image,context),).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image,BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backGroundColor: isDarkMode?TColors.darkerGrey:TColors.light,
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.all(16),
        child: CachedNetworkImage(
          imageUrl: image ,
          fit:  BoxFit.contain,
          progressIndicatorBuilder: (context, url, progress) => Center(child: CircularProgressIndicator(value: progress.progress, color: TColors.primaryColor,)),
          errorWidget: (context, url, error) => const Center(child:  Icon(Icons.error)),
        )
      ),
    );
  }
}
