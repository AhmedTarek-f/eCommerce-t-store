import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/colors.dart';

class TFormDivider extends StatelessWidget {
  const TFormDivider({
    super.key, required this.dividerText,
  });

  final String dividerText;
  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Divider(color: isDark?TColors.darkGrey:TColors.grey,thickness: 0.5,indent: 60,endIndent: 5,)),
        Text(dividerText.tr,style:Theme.of(context).textTheme.labelMedium,),
        Flexible(child: Divider(color: isDark?TColors.darkGrey:TColors.grey,thickness: 0.5,indent: 5,endIndent: 60)),
      ],
    );
  }
}
