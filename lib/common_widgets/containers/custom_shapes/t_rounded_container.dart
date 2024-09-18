import 'package:flutter/material.dart';
import 'package:t_store/core/constants/colors.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius =16,
    this.padding=EdgeInsets.zero,
    this.child,
    this.backGroundColor = TColors.white,
    this.margin,
    this.showBorder = false,
    this.borderColor,
  });
  final double? width;
  final double? height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final Color backGroundColor;
  final EdgeInsetsGeometry? margin;
  final bool showBorder;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        border: showBorder? Border.all(color:borderColor?? TColors.grey):null,
        borderRadius: BorderRadius.circular(radius),
        color: backGroundColor,
      ),
      child: child,
    );
  }
}
