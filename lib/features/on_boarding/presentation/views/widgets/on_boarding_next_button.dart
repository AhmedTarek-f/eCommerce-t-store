import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/featrues/on_boarding/presentation/views_model/on_boarding_cubit.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit boardingProvider = BlocProvider.of<OnBoardingCubit>(context);
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Positioned(
      bottom: kBottomNavigationBarHeight,
      right: MediaQuery.sizeOf(context).width*0.0611,
      child: ElevatedButton(
        onPressed: (){
          boardingProvider.nextPage(context);
        },
        style: ElevatedButton.styleFrom(shape: const CircleBorder(),backgroundColor: isDark?TColors.primaryColor:Colors.black),
        child: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}