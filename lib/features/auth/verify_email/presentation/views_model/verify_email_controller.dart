import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/success_screen.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';

class VerifyEmailController extends GetxController
{
  static VerifyEmailController get instance => Get.find();

  // Send Email When ever Verify Screen appears & set timer for auto redirect
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();

  }

  // Send Email Verification link
 Future<void> sendEmailVerification()async{
    try{
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(title: "Email Sent".tr,message: "Please check your inbox and verify your email.".tr);
    }
    catch(e)
   {
     TLoaders.errorSnackBar(title: "Oh Snap!".tr,message: e.toString().tr);
   }
  }

  // Timer to automatically redirect on Email Verification
  Future<void> setTimerForAutoRedirect() async
  {
    Timer.periodic(
        const Duration(seconds: 1),
        (timer) async{
          await FirebaseAuth.instance.currentUser?.reload();
          final user = FirebaseAuth.instance.currentUser;
          if(user?.emailVerified ?? false)
            {
              timer.cancel();
              Get.off(()=>SuccessScreen(
                isAnimation: true,
                image: TImages.successfullyRegisterAnimation,
                title:"Your account successfully created!".tr,
                subTitle: "Welcome to Your Ultimate Shopping Destination Your Account is Created, Unleash the Joy of Seamless Online Shopping!".tr,
                onPressed: ()=> AuthenticationRepository.instance.screenRedirect(),
              )
              );
            }
        },
    );
  }
  // Manually check if email verified
  Future<void> checkEmailVerificationStatus() async{
    final currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser!=null && currentUser.emailVerified)
    {
      Get.off(()=>SuccessScreen(
        isAnimation: true,
        image: TImages.successfullyRegisterAnimation,
        title:"Your account created".tr,
        subTitle: "",
        onPressed: ()=> AuthenticationRepository.instance.screenRedirect(),
      )
      );
    }
  }

}