import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_shimmer_effect.dart';
import 'package:t_store/core/constants/colors.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width=56,
    this.height=56,
    this.padding,
    this.isNetworkImage=false,
    required this.image,
    this.fit =BoxFit.cover,
    this.overlayColor,
    this.backgroundColor,
    this.isOverLayColor = true,
  });
  final double width,height;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final String image;
  final BoxFit? fit;
  final Color? overlayColor;
  final Color? backgroundColor;
  final bool isOverLayColor;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color:backgroundColor?? (isDarkMode? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage ? CachedNetworkImage(
          imageUrl: image ,
          fit:fit,
          color: overlayColor,
          progressIndicatorBuilder: (context, url, progress) => const TShimmerEffect(width: 80, height: 80,radius: 80,),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        )
            : Image.asset(
          image,
          color:isOverLayColor? overlayColor?? (isDarkMode?TColors.white:TColors.black): null,
        ),
      )
    );
  }
}
