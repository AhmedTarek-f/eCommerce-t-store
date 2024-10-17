import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/on_boarding/presentation/views_model/on_boarding_controller.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnBoardingController controller = OnBoardingController.instance;
    return Positioned(
      right:MediaQuery.sizeOf(context).width*0.0611,
      top:kToolbarHeight,
      child: TextButton(
        onPressed: (){
          controller.skipPage();
        },
        child: Text(
          "Skip".tr,
        ),
      ),
    );
  }
}