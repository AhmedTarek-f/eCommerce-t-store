import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/utlis/loaders/t_animation_loader_widget.dart';

abstract class TFullScreenLoader
{
  static void openLoadingDialog(String text, String animation)
  {
    final bool isDarkMode = Theme.of(Get.context!).brightness == Brightness.dark;
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
          canPop: false,
            child: Container(
              color: isDarkMode?TColors.dark : TColors.white,
              width: Get.width,
              height: Get.height,
              child: Column(
                children: [
                  const SizedBox(height: 200,),
                  TAnimationLoaderWidget(text: text, animation: animation,)
                ],
              ),
            )
        ),

    );
  }

  static void stopLoading()
  {
    Navigator.of(Get.overlayContext!).pop();
  }
}