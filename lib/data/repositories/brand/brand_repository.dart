import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utlis/exceptions/t_firebase_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_platform_exceptions.dart';
import 'package:t_store/features/shop/all_brands/model/brand_model.dart';
import 'package:t_store/features/shop/store/model/brand_category_model.dart';

class BrandRepository extends GetxController
{
  static BrandRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands() async {
    try{
      final snapshot = await _db.collection("Brands").get();
      final List<BrandModel> brandsList = snapshot.docs.map((brand) => BrandModel.fromSnapshot(brand)).toList();
      return brandsList;
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
      throw "Something went wrong, Please try again";
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try{
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _db.collection("BrandCategory").where("CategoryId",isEqualTo: categoryId).get();
      List<String> brandsIdList = querySnapshot.docs.map((doc) => doc["BrandId"] as String).toList();

      //  Same but in two steps
      // final List<BrandCategoryModel> categoryBrandIds = querySnapshot.docs.map((data) => BrandCategoryModel.fromSnapshot(data)).toList();
      // List<String> brandsIdList = categoryBrandIds.map((brandIds) => brandIds.brandId).toList();
      final brandsQuery = await _db.collection("Brands").where(FieldPath.documentId , whereIn:brandsIdList ).limit(2).get();
      final List<BrandModel> brands = brandsQuery.docs.map((brand) => BrandModel.fromSnapshot(brand)).toList();
      return brands;
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
      throw "Something went wrong, Please try again";
    }
  }
}