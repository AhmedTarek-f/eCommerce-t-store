import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:t_store/core/app_router.dart';
import 'package:t_store/core/constants/image_strings.dart';

class SuccessVerificationViewBody extends StatelessWidget {
  const SuccessVerificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.sizeOf(context).height*0.1307,
          bottom: MediaQuery.sizeOf(context).height*0.0513,
          right: MediaQuery.sizeOf(context).width*0.09,
          left: MediaQuery.sizeOf(context).width*0.09,
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              TImages.staticSuccessIllustration,
              width: MediaQuery.sizeOf(context).width*0.6,
            ),
            const SizedBox(height: 32,),
            Text("Your account successfully created!",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            const SizedBox(height: 16,),
            Text("Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!",style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            const SizedBox(height: 32,),

            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: ElevatedButton(
                onPressed: (){GoRouter.of(context).pushReplacement(AppRouter.kLogInView);},
                child: const Text("Continue"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}