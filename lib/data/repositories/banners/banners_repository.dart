import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utlis/exceptions/t_firebase_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_platform_exceptions.dart';
import 'package:t_store/features/shop/home/model/banner_model.dart';

class BannersRepository extends GetxController {
  static BannersRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> getAllBanners() async {
    try{
      final snapshot = await _db.collection("Banners").where("Active",isEqualTo: true).get();
      final List<BannerModel> allBannersList = snapshot.docs.map((bannerDocument) => BannerModel.fromSnapshot(bannerDocument)).toList();
      return allBannersList;
    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;
    }
    on PlatformException catch(e)
    {
      throw TPlatformException(e.code).message;
    }
    catch (e)
    {
      throw "Something went wrong, Please try again".tr;
    }

  }
}