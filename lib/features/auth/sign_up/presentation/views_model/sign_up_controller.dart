import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/network_connection/network_manager.dart';
import 'package:t_store/core/utlis/popups/t_full_screen_loader.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/auth/sign_up/model/user_model.dart';
import 'package:t_store/features/auth/verify_email/presentation/views/verify_email_view.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';

class SignUpController extends GetxController
{
  static SignUpController get instance => Get.find();
  bool checkBoxSign = false;
  bool hidePassword = true;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final UserController userController= Get.put(UserController());
  void applyAutoValidateMode()
  {
    autoValidateMode = AutovalidateMode.always;
    update();
  }
  void disableAutoValidateMode()
  {
    autoValidateMode = AutovalidateMode.disabled;
    update();
  }
  void hideShowPassword()
  {
    hidePassword = !hidePassword;
    update();
  }
  void checkBoxSignChange()
  {
    checkBoxSign = !checkBoxSign;
    update();
  }

  Future<void> signUp()async {
    try{
      if(!signUpFormKey.currentState!.validate())
        {
          applyAutoValidateMode();
          return;
        }
      else if(!checkBoxSign)
        {
          TLoaders.warningSnackBar(
            title: "Accept Privacy Police",
            message: "In order to create account, you must have to read and accept the Privacy policy & Terms of Use",
          );
          return;
        }
      else{
        disableAutoValidateMode();
        TFullScreenLoader.openLoadingDialog("We are processing your information...", TImages.docerAnimation);
        final UserCredential userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());
        final newUser = UserModel(
            id: userCredential.user!.uid,
            firstName: firstName.text.trim(),
            lastName: lastName.text.trim(),
            username: userName.text.trim(),
            email: email.text.trim(),
            phoneNumber: phoneNumber.text.trim(),
            profilePicture: ""
        );
        final UserRepository userRepository = Get.put(UserRepository());
        await userRepository.saveUserRecord(newUser);
        TFullScreenLoader.stopLoading();
        TLoaders.successSnackBar(title: "Congratulations",message: "Your account has been created! Verify email to continue.");
        Get.to(()=> VerifyEmailView(email: email.text.trim(),));
      }
    }
    catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }

  Future<void> signUpWithGoogle() async
  {
    try{
      TFullScreenLoader.openLoadingDialog("We are processing your information...", TImages.docerAnimation);
      final UserCredential userCredential = await AuthenticationRepository.instance.signInWithGoogle();
      if(userCredential.additionalUserInfo?.isNewUser ?? false){
        await userController.saveGoogleUserRecord(userCredential);
      }
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    }
    catch(e)
    {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
    firstName.dispose();
     lastName.dispose();
     userName.dispose();
     email.dispose();
     phoneNumber.dispose();
     password.dispose();
  }

}