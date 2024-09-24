import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/featrues/on_boarding/presentation/views_model/on_boarding_cubit.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit boardingProvider = BlocProvider.of<OnBoardingCubit>(context);
    final bool isDark =Theme.of(context).brightness==Brightness.dark;
    return Positioned(
      bottom:kBottomNavigationBarHeight,
      left:MediaQuery.sizeOf(context).width*0.0611,
      child: SmoothPageIndicator(
        controller: boardingProvider.pageController,
        count: 3,
        onDotClicked: boardingProvider.dotNavigationClicked,
        effect:ExpandingDotsEffect(
            activeDotColor:isDark?TColors.light:TColors.dark,
            dotHeight: 6,
        ),
      ),
    );
  }
}
