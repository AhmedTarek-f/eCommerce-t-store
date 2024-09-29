import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/on_boarding/presentation/views_model/on_boarding_controller.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final OnBoardingController controller = OnBoardingController.instance;
    final bool isDark =Theme.of(context).brightness==Brightness.dark;
    return Positioned(
      bottom:kBottomNavigationBarHeight,
      left:MediaQuery.sizeOf(context).width*0.0611,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: (index) => controller.dotNavigationClicked(index),
        effect:ExpandingDotsEffect(
            activeDotColor:isDark?TColors.light:TColors.dark,
            dotHeight: 6,
        ),
      ),
    );
  }
}
