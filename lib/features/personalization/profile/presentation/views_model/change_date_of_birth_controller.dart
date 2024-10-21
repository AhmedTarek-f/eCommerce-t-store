import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/popups/t_full_screen_loader.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';

class ChangeDateOfBirthController extends GetxController{
  static ChangeDateOfBirthController get instance => Get.find();

  final UserController userController = UserController.instance;
  final UserRepository userRepository = UserRepository.instance;
  final TextEditingController dateOfBirth = TextEditingController();
  DateTime? _selectedDate;

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Initial date
      firstDate: DateTime(1900), // Start date for the date picker
      lastDate: DateTime.now(), // End date is today
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      // Format the date and display it in the text field
      dateOfBirth.text = DateFormat('yyyy-MM-dd').format(pickedDate);
    }
  }
  Future<void> updateDateOfBirth() async {
    if(dateOfBirth.text.isEmpty || dateOfBirth.text.trim() == "")
      {
        TLoaders.errorSnackBar(title: "Date Of Birth" , message: "Date of birth can't be saved empty. Please pick your date of birth.");
      }
    else{
      try{
        userController.dateOfBirthLoading.value = true;
        TFullScreenLoader.openLoadingDialog("We are updating your information...", TImages.docerAnimation);
        Map<String, dynamic> dateOfBirthJson = {
          "DateOfBirth":_selectedDate,
        };
        await userRepository.updateSingleField(dateOfBirthJson);
        userController.user.value.dateOfBirth = _selectedDate;
        TFullScreenLoader.stopLoading();
        Get.back();
        TLoaders.successSnackBar(title: "Congratulations",message: "Your date of birth has been updated");
      }catch (e){
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(title: "Oh Snap!",message:  e.toString());
      }
      finally{
        userController.dateOfBirthLoading.value = false;
      }
    }
  }

  @override
  void onClose() {
    dateOfBirth.dispose();
    super.onClose();
  }
}

