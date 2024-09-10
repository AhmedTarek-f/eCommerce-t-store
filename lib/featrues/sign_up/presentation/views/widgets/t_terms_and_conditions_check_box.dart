import 'package:flutter/material.dart';
import 'package:t_store/core/constants/colors.dart';

class TTermsAndConditionsCheckBox extends StatelessWidget {
  const TTermsAndConditionsCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width:24,height: 24,child: Checkbox(value: true, onChanged: (value){})),
          const SizedBox(width:16,),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text:"I agree to ",style:Theme.of(context).textTheme.bodySmall ),
                TextSpan(text:"Privacy Policy ",style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDark? TColors.white: TColors.primary,
                  decoration:  TextDecoration.underline,
                  decorationColor: isDark?TColors.white: TColors.primary,
                ),),
                TextSpan(text:"and ",style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text:"Terms of use",style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDark? TColors.white: TColors.primary,
                  decoration:  TextDecoration.underline,
                  decorationColor: isDark?TColors.white: TColors.primary,
                ), ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
