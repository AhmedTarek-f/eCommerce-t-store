import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/core/constants/colors.dart';

class TCouponCode extends StatelessWidget {
  const TCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TRoundedContainer(
      showBorder: true,
      backGroundColor: isDarkMode? TColors.dark:TColors.white,
      padding: const EdgeInsets.only(left: 16,right: 8,bottom: 8,top: 8),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Have a promo code? Enter here".tr,
                border: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                foregroundColor: isDarkMode?TColors.white.withOpacity(0.5):TColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: Text("Apply".tr),
            ),
          ),
        ],
      ),
    );
  }
}
