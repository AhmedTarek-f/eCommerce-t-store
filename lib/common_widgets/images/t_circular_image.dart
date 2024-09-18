import 'package:flutter/material.dart';
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
  });
  final double width,height;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final String image;
  final BoxFit? fit;
  final Color? overlayColor;
  final Color? backgroundColor;
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
      child: isNetworkImage ? Image.network(image,fit:fit,) :Image.asset(
        image,
        color:overlayColor?? (isDarkMode?TColors.white:TColors.black),
      ),
    );
  }
}
