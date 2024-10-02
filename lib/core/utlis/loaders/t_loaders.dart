import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/core/constants/colors.dart';

abstract class TLoaders {
  static successSnackBar ({required title, message =""})
  {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: TColors.white,
      backgroundColor: TColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      duration:  const Duration(seconds: 3),
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