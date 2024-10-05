import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/popups/t_full_screen_loader.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/auth/password_configuration/presentation/views/reset_password_view.dart';

class ForgetPasswordController extends GetxController
{
  static ForgetPasswordController get instance => Get.find();

  GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

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

  Future<void> sendPasswordResetEmail() async{
    try{
      if(!forgetPasswordKey.currentState!.validate()){
        applyAutoValidateMode();
      }
      else{
        disableAutoValidateMode();
        TFullScreenLoader.openLoadingDialog("Processing your request...", TImages.docerAnimation);
        await AuthenticationRepository.instance.sendPasswordResetEmail(email: email.text.trim());
        TFullScreenLoader.stopLoading();
        TLoaders.successSnackBar(
            title: "Email Sent",
            message: "Email Link Sent to Reset your Password",
        );
        Get.to(()=> ResetPasswordView(email: email.text.trim(),));
      }
    }
    catch(e)
    {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
          title: "Oh snap!",
          message: e.toString(),
      );
    }

  }


  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}