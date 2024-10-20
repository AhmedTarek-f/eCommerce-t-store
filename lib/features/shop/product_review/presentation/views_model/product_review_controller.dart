import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/utlis/loaders/t_loaders.dart';
import 'package:t_store/data/repositories/reviews/reviews_repository.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';
import 'package:t_store/features/shop/product_review/model/product_review_model.dart';

class ProductReviewController extends GetxController {
  static ProductReviewController get instance => Get.find();
  final ReviewsRepository _reviewsRepository = ReviewsRepository.instance;
  final UserController _userController = UserController.instance;
  RxList<ProductReviewModel> reviewsList = <ProductReviewModel>[].obs;
  double rating5=0.0,rating4=0.0,rating3=0.0,rating2=0.0,rating1 =0.0;
  double totalRating = 0.0;

  RxDouble rating = 1.0.obs;
  RxBool isLoading = false.obs;
  TextEditingController userReview = TextEditingController();

  @override
  Future<void> onInit() async {
    super.onInit();
    String productId = Get.arguments as String;
    log("The Product Id : $productId");
    isLoading.value = true;
    await fetchUsersReviews(productId: productId);
    isLoading.value = false;
    userReview.text = "";
  }

  Future<void> addUserReview({required ProductReviewModel productReview , required String productId}) async {
    try {
      isLoading.value = true;
      await _reviewsRepository.addReview(productReview, productId);
      await fetchUsersReviews(productId: productId);
      isLoading.value = false;
      TLoaders.successSnackBar(title: "review",message: "Your review has been added successfully");
    }
    catch(e) {
      isLoading.value = false;
      TLoaders.errorSnackBar(title: "Oh Snap".tr,message: e.toString());
    }
  }

  Future<void> checkUserReview({required String productId}) async{
    if(userReview.text.isEmpty || userReview.text.trim() == "") {
      TLoaders.warningSnackBar(title: "review check",message: "You can't send an empty review. please write something and send it again.");
    }
    else {
      final ProductReviewModel productReview = ProductReviewModel(
        userName: _userController.user.value.username,
        userImage: _userController.user.value.profilePicture,
        rating: rating.value,
        reviewDate: DateTime.now(),
        comment: userReview.text,
      );
      await addUserReview(productReview: productReview, productId: productId);
      userReview.clear();
      rating.value = 1.0;
    }
  }

  Future<List<ProductReviewModel>> fetchUsersReviews({required String productId}) async{
    try {
      reviewsList.clear();
      List<ProductReviewModel> productReviews = await _reviewsRepository.fetchReviewsForSpecificProduct(productId);
      reviewsList.assignAll(productReviews);
      assignUsersRating();
      return productReviews;
    }
    catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!".tr,message: e.toString());
      return [];
    }
  }

  Future<void> deleteUserReview({required String productId}) async {
    try{
      await  _reviewsRepository.deleteUserReview(productId);
      TLoaders.successSnackBar(title: "Deleted",message: "Your review has been deleted successfully.");
    }
    catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!".tr,message: e.toString());
    }

  }

  void assignUsersRating() {
    final List<ProductReviewModel> ratingsWith5;
    final List<ProductReviewModel> ratingsWith4;
    final List<ProductReviewModel> ratingsWith3;
    final List<ProductReviewModel> ratingsWith2;
    final List<ProductReviewModel> ratingsWith1;
    ratingsWith5 = reviewsList.where((review) => review.rating == 5.0).toList();
    ratingsWith4 = reviewsList.where((review) => review.rating == 4.0).toList();
    ratingsWith3 = reviewsList.where((review) => review.rating == 3.0).toList();
    ratingsWith2 = reviewsList.where((review) => review.rating == 2.0).toList();
    ratingsWith1 = reviewsList.where((review) => review.rating == 1.0).toList();
    rating1= ratingsWith1.length/reviewsList.length;
    rating2= ratingsWith2.length/reviewsList.length;
    rating3= ratingsWith3.length/reviewsList.length;
    rating4= ratingsWith4.length/reviewsList.length;
    rating5= ratingsWith5.length/reviewsList.length;
    totalRating = ((rating1*1)+(rating2*2)+(rating3*3)+(rating4*4)+(rating5*5)) / reviewsList.length;
  }

  @override
  void onClose() {
    userReview.dispose();
    super.onClose();
  }
}