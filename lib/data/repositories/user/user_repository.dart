import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utlis/exceptions/t_firebase_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_format_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_platform_exceptions.dart';
import 'package:t_store/features/auth/sign_up/model/user_model.dart';

class UserRepository extends GetxController
{
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _userData = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try{
      await _userData.collection("Users").doc(user.id).set(user.toJson());
    }on FirebaseException catch(e)
    {
      throw TFirebaseException(e.code).message;
    }on FormatException catch(_)
    {
      throw const TFormatException();
    }on PlatformException catch(e){
      throw TPlatformException(e.code).message;
    }
    catch(e)
    {
      throw "something went wrong. Please try again";
    }
  }

}