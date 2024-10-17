import 'package:flutter/material.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/on_boarding/presentation/views_model/language_controller.dart';
import 'package:t_store/features/on_boarding/presentation/views_model/on_boarding_controller.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnBoardingController controller = OnBoardingController.instance;
    final LanguageController languageController = LanguageController.instance;
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Positioned(
      bottom: kBottomNavigationBarHeight,
      left:languageController.language.value == "ar"?  MediaQuery.sizeOf(context).width*0.0611 : null,
      right: languageController.language.value == "en"? MediaQuery.sizeOf(context).width*0.0611 : null,
      child: ElevatedButton(
        onPressed: (){
          controller.nextPage();
        },
        style: ElevatedButton.styleFrom(shape: const CircleBorder(),backgroundColor: isDark?TColors.primaryColor:Colors.black),
        child: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}