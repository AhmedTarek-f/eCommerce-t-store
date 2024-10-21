import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utlis/exceptions/t_firebase_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_platform_exceptions.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/personalization/my_coupons/model/coupons_model.dart';

class CouponsRepository extends GetxController
{
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final AuthenticationRepository _authenticationRepository = AuthenticationRepository.instance;

  Future<List<CouponsModel>> fetchMyCoupons() async {
    try {
      final snapshot = await _db.collection("Users").doc(_authenticationRepository.authUser!.uid).collection("Coupons").get();
      final List<CouponsModel> coupons = snapshot.docs.map((coupon) => CouponsModel.fromSnapshot(coupon)).toList();
      return coupons;
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
      throw "Something went wrong while fetching your coupons. Please try again later";
    }
  }

  Future<List<CouponsModel>> fetchMyCouponsAr() async {
    try {
      final snapshot = await _db.collection("Users").doc(_authenticationRepository.authUser!.uid).collection("ArCoupons").get();
      final List<CouponsModel> coupons = snapshot.docs.map((coupon) => CouponsModel.fromSnapshot(coupon)).toList();
      return coupons;
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
      throw "Something went wrong while fetching your coupons. Please try again later";
    }
  }
}