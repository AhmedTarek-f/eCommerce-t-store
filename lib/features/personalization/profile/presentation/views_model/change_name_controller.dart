import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/popups/t_full_screen_loader.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';
import 'package:t_store/features/personalization/profile/presentation/views/profile_view.dart';

class ChangeNameController extends GetxController{
  static ChangeNameController get instance => Get.find();

  final UserController userController = UserController.instance;
  final UserRepository userRepository = UserRepository.instance;

  GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }
  void initializeNames()
  {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
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

  Future<void> updateUserName() async {
    if(!nameFormKey.currentState!.validate())
      {
        applyAutoValidateMode();
      }
    else{
      try{
        userController.nameChangeLoading.value = true;
        TFullScreenLoader.openLoadingDialog("We are updating your information...", TImages.docerAnimation);
        Map<String, dynamic> name = {
          "FirstName":firstName.text.trim(),
          "LastName":lastName.text.trim(),
        };
        await userRepository.updateSingleField(name);
        userController.user.value.firstName = firstName.text.trim();
        userController.user.value.lastName = lastName.text.trim();
        TFullScreenLoader.stopLoading();
        Get.back();
        TLoaders.successSnackBar(title: "Congratulations",message: "Your name has been updated");
      }catch (e){
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: "Oh Snap!",message:  e.toString());
      }
      finally{
        userController.nameChangeLoading.value = false;
      }

    }

  }

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    super.onClose();
  }
}

