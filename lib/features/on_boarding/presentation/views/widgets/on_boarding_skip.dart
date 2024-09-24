import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/on_boarding/presentation/views_model/on_boarding_cubit.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit boardingProvider = BlocProvider.of<OnBoardingCubit>(context);
    return Positioned(
      right:MediaQuery.sizeOf(context).width*0.0611,
      top:kToolbarHeight,
      child: TextButton(
        onPressed: (){
          boardingProvider.skipPage();
        },
        child: const Text(
          "Skip",
        ),
      ),
    );
  }
}