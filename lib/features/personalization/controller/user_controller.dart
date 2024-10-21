import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/core/utlis/popups/t_full_screen_loader.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/auth/log_in/presentation/views/log_in_view.dart';
import 'package:t_store/features/auth/sign_up/model/user_model.dart';
import 'package:t_store/features/personalization/profile/presentation/views/re_auth_user_login_view.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  Rx<bool> profileLoading = false.obs;
  Rx<bool> imageUploading = false.obs;
  Rx<bool> nameChangeLoading = false.obs;
  Rx<bool> genderChangeLoading = false.obs;
  Rx<bool> phoneNumberLoading = false.obs;
  Rx<bool> dateOfBirthLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  bool hidePassword = true;
  final UserRepository userRepository = Get.put(UserRepository());
  final TextEditingController verifyEmail = TextEditingController();
  final TextEditingController verifyPassword = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();
  final GetStorage _storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  bool isArabic() {
    final String language = _storage.read("lang");
    return language == "ar";
  }

  void applyAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    update();
  }

  void disableAutoValidateMode() {
    autoValidateMode = AutovalidateMode.disabled;
    update();
  }

  void hideShowPassword() {
    hidePassword = !hidePassword;
    update();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final UserModel user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveGoogleUserRecord(UserCredential? userCredential) async {
    try {
      await fetchUserRecord();
      if(user.value.id.isEmpty)
        {
          if (userCredential != null) {
            final nameParts =
            UserModel.nameParts(userCredential.user!.displayName ?? "");
            final userName =
            UserModel.generateUsername(userCredential.user!.displayName ?? "");

            final user = UserModel(
              id: userCredential.user!.uid,
              username: userName,
              email: userCredential.user!.email ?? "",
              firstName: nameParts[0],
              lastName: nameParts.length > 1
                  ? nameParts.sublist(1).join(" ")
                  : nameParts[1],
              phoneNumber: userCredential.user!.phoneNumber ?? "",
              profilePicture: userCredential.user!.photoURL ?? "",
            );

            await userRepository.saveUserRecord(user);
          }
        }

    } catch (e) {
      TLoaders.warningSnackBar(
        title: "Data not saved",
        message:
            "Something went wrong while saving your information. You can re-save your data in your profile.",
      );
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(16),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.",
      confirm: ElevatedButton(
        onPressed: () async{
          await deleteUserAccount();
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red,side: const BorderSide(color: Colors.red)),
        child: const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 24),
          child: Text("Delete"),
        ),
      ),
      cancel: ElevatedButton(
          onPressed: () {Navigator.of(Get.overlayContext!).pop();},
          child: const Text("Cancel"),
      ),
    );
  }

  Future<void> deleteUserAccount() async {
    try{
      TFullScreenLoader.openLoadingDialog("Processing...", TImages.docerAnimation);
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e)=> e.providerId).first;
      if(provider.isNotEmpty)
        {
          if(provider == "google.com"){
            await auth.signInWithGoogle();
            await auth.deleteAccount();
            TFullScreenLoader.stopLoading();
            Get.offAll(() => const LogInView());
          }
          else if(provider == "password"){
            TFullScreenLoader.stopLoading();
            Get.to(() => const ReAuthUserLoginView());
          }
        }
    }
    catch (e)
    {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }

  Future<void> reAuthenticateEmailAndPassword() async {
    try{
      if(!reAuthFormKey.currentState!.validate()){
        applyAutoValidateMode();
        update();
      }
      else{
        TFullScreenLoader.openLoadingDialog("Processing...", TImages.docerAnimation);
        await AuthenticationRepository.instance.reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
        await AuthenticationRepository.instance.deleteAccount();
        TFullScreenLoader.stopLoading();
        Get.offAll(()=> const LogInView());
      }
    }catch (e)
    {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!",message: e.toString());
    }
  }

  Future<void> uploadUserProfilePicture() async
  {
    try{
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value =true;
        final String imageUrl =
            await userRepository.uploadImage("Users/Images/Profile/", image);

        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(title: "Congratulations",message: "Your profile image has been updated.");
      }
    }
    catch(e){
      TLoaders.errorSnackBar(title: "Oh Snap!", message: "Something went wrong: $e");
    }
    finally{
      imageUploading.value =false;
    }
  }

  @override
  void onClose() {
    verifyEmail.dispose();
    verifyPassword.dispose();
    super.onClose();
  }
}
