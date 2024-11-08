import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:t_store/core/constants/colors.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction =false,
    this.actionText,
    this.onActionPressed
  });

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(animation,width: MediaQuery.sizeOf(context).width*0.8),
          const SizedBox(height: 24,),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24,),
          if(showAction)SizedBox(
            width: 250,
            child: OutlinedButton(
              onPressed: onActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),
              child: Text(
                actionText ?? "",
                style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
