import 'package:flutter/material.dart';
import 'package:t_store/core/constants/sizes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key, required this.onBoardingImage, required this.onBoardingTitle, required this.onBoardingSubTitle,
  });
  final String onBoardingImage;
  final String onBoardingTitle;
  final String onBoardingSubTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width*0.0611,
          vertical: MediaQuery.sizeOf(context).height*0.028,
      ),
      child: Column(
        children: [
          Image.asset(
            onBoardingImage,
            width: MediaQuery.sizeOf(context).width*0.8,
            height: MediaQuery.sizeOf(context).height*0.6,
          ),
          Text(
            onBoardingTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBetItems,),
          Text(
            onBoardingSubTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
