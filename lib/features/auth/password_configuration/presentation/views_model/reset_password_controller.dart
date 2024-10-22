import 'package:get/get.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/popups/t_full_screen_loader.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';

class ResetPasswordController extends GetxController
{
  static ResetPasswordController get instance => Get.find();


  Future<void> resendPasswordResetEmail({required String email}) async{
    try{
        TFullScreenLoader.openLoadingDialog("Processing your request...".tr, TImages.docerAnimation);
        await AuthenticationRepository.instance.sendPasswordResetEmail(email: email);
        TFullScreenLoader.stopLoading();
        TLoaders.successSnackBar(
          title: "Email Sent".tr,
          message: "Email Link Sent to Reset your Password".tr,
        );
    }
    catch(e)
    {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: "Oh Snap!".tr,
        message: e.toString().tr,
      );
    }

  }
}