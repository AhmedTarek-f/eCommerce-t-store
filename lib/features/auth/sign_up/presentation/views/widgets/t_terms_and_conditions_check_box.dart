import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/auth/sign_up/presentation/views_model/sign_up_controller.dart';

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
          SizedBox(width:24,height: 24,child: GetBuilder<SignUpController>(
              builder: (controller) => Checkbox(value: controller.checkBoxSign, onChanged: (value){
                controller.checkBoxSignChange();
              }),),),
          const SizedBox(width:16,),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text:"I agree to ".tr,style:Theme.of(context).textTheme.bodySmall ),
                TextSpan(text:"Privacy Policy ".tr,style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDark? TColors.white: TColors.primary,
                  decoration:  TextDecoration.underline,
                  decorationColor: isDark?TColors.white: TColors.primary,
                ),),
                TextSpan(text:"and ".tr,style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text:"Terms of use".tr,style: Theme.of(context).textTheme.bodyMedium!.apply(
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
