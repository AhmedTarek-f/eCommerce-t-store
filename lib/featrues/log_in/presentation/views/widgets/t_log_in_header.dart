import 'package:flutter/material.dart';
import 'package:t_store/core/constants/image_strings.dart';

class TLogInHeader extends StatelessWidget {
  const TLogInHeader({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          isDark?TImages.lightAppLogo:TImages.darkAppLogo,
          height: MediaQuery.sizeOf(context).height*0.1718,
        ),
        Text("Welcome Back,",style: Theme.of(context).textTheme.headlineMedium,),
        const SizedBox(height: 8,),
        Text("Discover Limitless choices and Unmatched Convenience.",style: Theme.of(context).textTheme.bodyMedium,)
      ],
    );
  }
}
