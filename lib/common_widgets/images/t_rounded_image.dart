import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_shimmer_effect.dart';
import 'package:t_store/core/constants/colors.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor = TColors.light,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = 16,
    this.shimmerWidth=300,
    this.shimmerHeight=60,
  });
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final double shimmerWidth , shimmerHeight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(border: border,color: backgroundColor,borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero ,
          child:isNetworkImage?
          CachedNetworkImage(
            imageUrl: imageUrl,
            width: width,
            height: height,
            fit: fit,
            progressIndicatorBuilder: (context, url, progress) => TShimmerEffect(width: shimmerWidth, height: shimmerHeight),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ):
          Image.asset(
            imageUrl,
            fit: fit,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}
