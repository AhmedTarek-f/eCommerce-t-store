import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/store/presentation/views/widget/t_brand_card.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key, required this.images,
  });
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backGroundColor: Colors.transparent,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          const TBrandCard(showBorder: false),
          const SizedBox(height: 16,),
          Row(
            children: images.map((image) => brandTopProductImageWidget(image,context),).toList(),
          )
        ],
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
        child: Image.asset(image,fit: BoxFit.contain,),
      ),
    );
  }
}
