import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/core/constants/colors.dart';

abstract class TLoaders {

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
          duration:  const Duration(seconds: 3),
          backgroundColor: Colors.transparent,
          content: Container(
            padding:  const EdgeInsets.all(12.0),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Theme.of(Get.context!).brightness == Brightness.dark ? TColors.darkerGrey.withOpacity(0.9) : TColors.grey.withOpacity(0.9),
            ),
            child: Center(child: Text(message,style: Theme.of(Get.context!).textTheme.labelLarge,),),
          )
      ),
    );
  }

  static successSnackBar ({required title, message ="",int secondsDuration = 3})
  {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: TColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration:  Duration(seconds: secondsDuration),
      margin:  const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2_copy,color: TColors.white,),
    );
  }
  static warningSnackBar ({required title, message =""})
  {
    Get.snackbar(
        title,
        message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      duration:  const Duration(seconds: 3),
      margin:  const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2_copy,color: TColors.white,),
    );
  }
  static errorSnackBar ({required title, message =""})
  {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      duration:  const Duration(seconds: 3),
      margin:  const EdgeInsets.all(20),
      icon: const Icon(Iconsax.warning_2_copy,color: TColors.white,),
    );
  }
}