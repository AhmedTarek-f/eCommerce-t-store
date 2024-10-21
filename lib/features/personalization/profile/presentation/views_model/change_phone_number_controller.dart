import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/popups/t_full_screen_loader.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';

class ChangePhoneNumberController extends GetxController{
  static ChangePhoneNumberController get instance => Get.find();

  final UserController userController = UserController.instance;
  final UserRepository userRepository = UserRepository.instance;
  GlobalKey<FormState> phoneNumberFormKey = GlobalKey<FormState>();
  final TextEditingController phoneNumber = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void onInit() {
    initializePhoneNumber();
    super.onInit();
  }
  void initializePhoneNumber()
  {
    phoneNumber.text = userController.user.value.phoneNumber.isNotEmpty ? userController.user.value.phoneNumber: "";
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

  Future<void> updatePhoneNumber() async {
    if(!phoneNumberFormKey.currentState!.validate())
      {
        applyAutoValidateMode();
      }
    else{
      try{
        userController.phoneNumberLoading.value = true;
        TFullScreenLoader.openLoadingDialog("We are updating your information...", TImages.docerAnimation);
        Map<String, dynamic> phone = {
          "PhoneNumber":phoneNumber.text.trim(),
        };
        await userRepository.updateSingleField(phone);
        userController.user.value.phoneNumber = phoneNumber.text.trim();
        TFullScreenLoader.stopLoading();
        Get.back();
        TLoaders.successSnackBar(title: "Congratulations",message: "Your phone number has been updated");
      }catch (e){
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: "Oh Snap!",message:  e.toString());
      }
      finally{
        userController.phoneNumberLoading.value = false;
      }

    }

  }

  @override
  void onClose() {
    phoneNumber.dispose();
    super.onClose();
  }
}

