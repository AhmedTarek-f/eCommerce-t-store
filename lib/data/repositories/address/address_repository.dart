import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utlis/exceptions/t_firebase_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_platform_exceptions.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/my_address/model/address_model.dart';

class AddressRepository extends GetxController
{
  static AddressRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) {
        throw "Unable to find user information, Try again in few minutes.".tr;
      }
      else{
        final result = await _db.collection("Users").doc(userId).collection("Addresses").get();
        return result.docs.map((userAddress) => AddressModel.fromSnapshot(userAddress)).toList();
      }
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong while fetching Address Information. Try again Later".tr;
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async{
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db.collection("Users").doc(userId).collection("Addresses").doc(addressId).update({"SelectedAddress":selected});
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Unable to update your address selection. Try again Later".tr;
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try{
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAddress = await _db.collection("Users").doc(userId).collection("Addresses").add(address.toJson());
      return currentAddress.id;
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong while saving Address Information. Try again Later".tr;
    }
  }

  Future<void> deleteUserAddress(String addressId) async {
    try {
      await _db.collection("Users").doc(_authenticationRepository.authUser!.uid).collection("Addresses").doc(addressId).delete();
    }
    on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong while deleting this Address Information. Try again Later".tr;
    }
  }
}