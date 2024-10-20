import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utlis/exceptions/t_firebase_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_format_exceptions.dart';
import 'package:t_store/core/utlis/exceptions/t_platform_exceptions.dart';
import 'package:t_store/data/repositories/authentication/authentication_repository.dart';
import 'package:t_store/features/shop/product_review/model/product_review_model.dart';

class ReviewsRepository extends GetxController {
  static ReviewsRepository get instance => Get.find();

  final AuthenticationRepository _authenticationRepository = AuthenticationRepository.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<ProductReviewModel>> fetchReviewsForSpecificProduct(String productId) async {
    try {
      final snapshot = await _db.collection("Products").doc(productId).collection("Reviews").get();
      return snapshot.docs.map((userReview) => ProductReviewModel.fromSnapshot(userReview)).toList();
    }
    on FirebaseException catch(e)
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
      throw "Something went wrong while fetching users reviews.";
    }
  }

  Future<void> addReview(ProductReviewModel review, String productId) async {
    try{
      await _db.collection("Products").doc(productId).collection("Reviews").doc(_authenticationRepository.authUser!.uid).set(review.toJson());
    }
    on FirebaseException catch(e)
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
      throw "Something went wrong while adding your review. Please try again";
    }

  }

  Future<int> fetchNumberOfReviewsForSpecificProduct(String productId) async {
    try {
      final snapshot = await _db.collection("Products").doc(productId).collection("Reviews").get();
      return snapshot.docs.length;
    }
    on FirebaseException catch(e)
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
      throw "Something went wrong while fetching reviews length.";
    }
  }

  Future<void> deleteUserReview(String productId) async{
    try {
      await _db.collection("Products").doc(productId).collection("Reviews").doc(_authenticationRepository.authUser!.uid).delete();
    }
    on FirebaseException catch(e)
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
      throw "Something went wrong while deleting your review";
    }

  }
}