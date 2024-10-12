import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utlis/exceptions/t_firebase_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_platform_exceptions.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try{
      final snapshot = await _db.collection("Products").where("IsFeatured",isEqualTo: true).limit(4).get();
      final List<ProductModel> listOfFeaturedProducts = snapshot.docs.map((product) => ProductModel.fromSnapshot(product)).toList();
      return listOfFeaturedProducts;
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

  Future<List<ProductModel>> fetchProductByQuery(Query query) async {
    try{
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((product) => ProductModel.fromQuerySnapshot(product)).toList();
      return productList;
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

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try{
      final snapshot = await _db.collection("Products").where("IsFeatured",isEqualTo: true).get();
      final List<ProductModel> listOfFeaturedProducts = snapshot.docs.map((product) => ProductModel.fromSnapshot(product)).toList();
      return listOfFeaturedProducts;
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

  Future<List<ProductModel>> getProductsForBrand({required String brandId , int limit = -1}) async {
    try{
      final querySnapshot = limit == -1
          ? await _db.collection("Products").where("Brand.Id",isEqualTo: brandId).get()
          : await _db.collection("Products").where("Brand.Id",isEqualTo: brandId).limit(limit).get();

      final List<ProductModel> products = querySnapshot.docs.map((product) => ProductModel.fromSnapshot(product)).toList();
      return products;
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

  Future<List<ProductModel>> getFavoriteProducts(List<String> productIds) async {
    try{
      final snapshot = await _db.collection("Products").where(FieldPath.documentId, whereIn: productIds).get();
      final List<ProductModel> products = snapshot.docs.map((product) => ProductModel.fromSnapshot(product)).toList();
      return products;
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

  Future<List<ProductModel>> getProductsForCategory({required String categoryId , int limit = -1}) async {
    try{
      final querySnapshot = limit == -1
          ? await _db.collection("Products").where("CategoryId",isEqualTo: categoryId).get()
          : await _db.collection("Products").where("CategoryId",isEqualTo: categoryId).limit(limit).get();

      final List<ProductModel> products = querySnapshot.docs.map((product) => ProductModel.fromSnapshot(product)).toList();
      return products;
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