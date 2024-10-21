import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/popups/t_full_screen_loader.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';

class ChangeGenderController extends GetxController{
  static ChangeGenderController get instance => Get.find();

  final UserController userController = UserController.instance;
  final UserRepository userRepository = UserRepository.instance;
  final TextEditingController gender = TextEditingController();

  Future<void> updateGender() async {

      if(gender.text.isEmpty || gender.text.trim() == "") {
        TLoaders.errorSnackBar(title: "Gender Selection", message: "You have to select your gender first then click on save");
      }
      else{
        try{
          userController.genderChangeLoading.value = true;
          TFullScreenLoader.openLoadingDialog("We are updating your information...", TImages.docerAnimation);
          Map<String, dynamic> genderJson = {
            "Gender":gender.text.trim(),
          };
          await userRepository.updateSingleField(genderJson);
          userController.user.value.gender = gender.text.trim();
          TFullScreenLoader.stopLoading();
          Get.back();
          TLoaders.successSnackBar(title: "Congratulations",message: "Your gender has been updated");
        }catch (e){
          TFullScreenLoader.stopLoading();
          TLoaders.errorSnackBar(title: "Oh Snap!",message:  e.toString());
        }
        finally{
          userController.genderChangeLoading.value = false;
        }
      }

  }

  @override
  void onClose() {
    gender.dispose();
    super.onClose();
  }
}

