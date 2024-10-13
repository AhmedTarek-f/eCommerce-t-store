import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utlis/exceptions/t_firebase_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_platform_exceptions.dart';
import 'package:t_store/features/shop/home/model/category_model.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<CategoryModel>> getAllCategories() async {
    try{
      final snapshot = await _db.collection("Categories").where("ParentId" , isEqualTo: null).get();
      final allCategoriesList = snapshot.docs.map((document) => CategoryModel.fromSnapShot(document)).toList();
      return allCategoriesList;
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
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try{
      final snapshot = await _db.collection("Categories").where( "ParentId" ,isEqualTo: categoryId).get();
      final subCategoriesList = snapshot.docs.map((category) => CategoryModel.fromSnapShot(category)).toList();
      return subCategoriesList;
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