import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/constants/text_strings.dart';
import 'package:t_store/featrues/on_boarding/presentation/views/widgets/on_boarding_dot_navigation.dart';
import 'package:t_store/featrues/on_boarding/presentation/views/widgets/on_boarding_next_button.dart';
import 'package:t_store/featrues/on_boarding/presentation/views/widgets/on_boarding_page.dart';
import 'package:t_store/featrues/on_boarding/presentation/views/widgets/on_boarding_skip.dart';
import 'package:t_store/featrues/on_boarding/presentation/views_model/on_boarding_cubit.dart';
import 'package:t_store/featrues/on_boarding/presentation/views_model/on_boarding_states.dart';


class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit boardingProvider = BlocProvider.of<OnBoardingCubit>(context);
    return BlocBuilder<OnBoardingCubit,OnBoardingStates>(
      builder: (context, state) => Stack(
        children: [
          PageView(
            controller: boardingProvider.pageController,
            onPageChanged: boardingProvider.updatingPageSwappingIndex,
            children: const [
              OnBoardingPage(
                onBoardingImage:TImages.onBoardingImage1,
                onBoardingTitle:TTexts.onBoardingTitle1 ,
                onBoardingSubTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                onBoardingImage:TImages.onBoardingImage2,
                onBoardingTitle:TTexts.onBoardingTitle2 ,
                onBoardingSubTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                onBoardingImage:TImages.onBoardingImage3,
                onBoardingTitle:TTexts.onBoardingTitle3 ,
                onBoardingSubTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}






