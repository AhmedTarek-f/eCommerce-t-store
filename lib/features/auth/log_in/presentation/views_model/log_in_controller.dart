import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/popups/t_full_screen_loader.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views/navigation_menu_view.dart';

class LogInController extends GetxController
{
  static LogInController get instance => Get.find();
  bool rememberMe = false;
  bool hidePassword = true;
  final GetStorage localStorage = GetStorage();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  final UserController userController = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    if(localStorage.read("REMEMBER_ME_VALUE") ?? false)
      {
        email.text= localStorage.read("REMEMBER_ME_EMAIL");
        password.text = localStorage.read("REMEMBER_ME_PASSWORD");
      }
  }

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
  void rememberMeSignChange()
  {
    rememberMe = !rememberMe;
    localStorage.write("REMEMBER_ME_VALUE", rememberMe);
    update();
  }

  Future<void> loginWithEmailAndPassword() async{
    try{
      if(!loginFormKey.currentState!.validate())
      {
        applyAutoValidateMode();
        return;
      }
      else{
        disableAutoValidateMode();
        TFullScreenLoader.openLoadingDialog("Logging you in...".tr, TImages.docerAnimation);
        final UserCredential userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
        if(rememberMe)
        {
          localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
          localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
        }
        TFullScreenLoader.stopLoading();
        Get.offAll(()=> const NavigationMenuView());
      }
    }
    catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!".tr,message: e.toString());
    }
  }
  Future<void> googleSignIn()async{
    try{
      TFullScreenLoader.openLoadingDialog("Logging you in...".tr, TImages.docerAnimation);
      final UserCredential userCredential = await AuthenticationRepository.instance.signInWithGoogle();
      if(userCredential.additionalUserInfo?.isNewUser ?? false){
        await userController.saveGoogleUserRecord(userCredential);
      }
      TFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    }
    catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!".tr,message: e.toString());
    }
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}