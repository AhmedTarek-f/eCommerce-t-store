import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/features/auth/sign_up/model/user_model.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final UserRepository userRepository = Get.put(UserRepository());
  
  Future<void> saveGoogleUserRecord(UserCredential? userCredential)async{
    try{
      if(userCredential != null)
        {
          final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? "");
          final userName = UserModel.generateUsername(userCredential.user!.displayName ?? "");
          
          final user = UserModel(
              id: userCredential.user!.uid,
              username: userName,
              email: userCredential.user!.email ?? "",
              firstName: nameParts[0],
              lastName: nameParts.length>1 ? nameParts.sublist(1).join(" "): nameParts[1], 
              phoneNumber: userCredential.user!.phoneNumber ?? "",
              profilePicture: userCredential.user!.photoURL?? "",
          );

          await userRepository.saveUserRecord(user);
        }
    }
    catch(e)
    {
      TLoaders.warningSnackBar(
        title: "Data not saved",
        message: "Something went wrong while saving your information. You can re-save your data in your profile.",
      );
    }
  }
}