import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/auth/verify_email/presentation/views/success_verification_view.dart';

class VerifyEmailViewBody extends StatelessWidget {
  const VerifyEmailViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.sizeOf(context).width.toString());
    log(MediaQuery.sizeOf(context).height.toString());
    return SingleChildScrollView(
      child:  Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.sizeOf(context).height*0.0280,
            bottom: MediaQuery.sizeOf(context).height*0.0280,
            right: MediaQuery.sizeOf(context).width*0.0611,
            left: MediaQuery.sizeOf(context).width*0.0611,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              TImages.deliveredEmailIllustration,
              width: MediaQuery.sizeOf(context).width*0.6,
            ),
            const SizedBox(height: 32,),
            Text("Verify your email address!",style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),
            const SizedBox(height: 16,),
            Text("support@codingwitht.com",style: Theme.of(context).textTheme.labelLarge,textAlign: TextAlign.center,),
            const SizedBox(height: 16,),
            Text("Congratulations! Your Account Awaits: Verify Your Email to Start Shopping and Experience a World Unrivaled Deals and Personalized Offers.",style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),
            const SizedBox(height: 32,),

            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: ElevatedButton(
                  onPressed: (){
                    Get.off(()=> const SuccessVerificationView());
                    },
                  child: const Text("Continue"),
              ),
            ),
            const SizedBox(height: 16,),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              child: TextButton(
                onPressed: (){},
                child: const Text("Resend Email"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/*
*  ElevatedButton(
    onPressed: (){
      WidgetsBinding.instance.addPostFrameCallback((_){
        GoRouter.of(context).pushReplacement(AppRouter.kSuccessScreen,extra: {
          'image': TImages.staticSuccessIllustration,
          'title': 'Your account successfully created! woo',
          'subTitle': 'Welcome to Your Ultimate Shopping Destination: Your Account is Created, Unleash the Joy of Seamless Online Shopping!',
          'onPressed':(){GoRouter.of(context).pushReplacement(AppRouter.kLogInView);},
        });});


      },
    child: const Text("Continue"),
)
  * */