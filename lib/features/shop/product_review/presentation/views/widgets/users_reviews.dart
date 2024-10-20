import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/shimmer/users_reviews_shimmer.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';
import 'package:t_store/features/shop/product_review/presentation/views/widgets/review_divider.dart';
import 'package:t_store/features/shop/product_review/presentation/views/widgets/review_form.dart';
import 'package:t_store/features/shop/product_review/presentation/views/widgets/t_over_all_product_rating.dart';
import 'package:t_store/features/shop/product_review/presentation/views/widgets/t_rating_bar_indicator.dart';
import 'package:t_store/features/shop/product_review/presentation/views/widgets/user_review_card.dart';
import 'package:t_store/features/shop/product_review/presentation/views_model/product_review_controller.dart';

class UsersReviews extends StatelessWidget {
  const UsersReviews({super.key});
  @override
  Widget build(BuildContext context) {
    final productId = Get.arguments as String;
    final ProductReviewController reviewController = ProductReviewController.instance;
    final UserController userController = UserController.instance;
    return Obx(
        () {
          final reviews = reviewController.reviewsList;

          if (reviewController.isLoading.value) {
            return const UsersReviewsShimmer();
          }
          else if (reviews.isEmpty) {
            return  Center(child: Text("No reviews found for this product yet!".tr),);
          }
          else{
            int userReviewIndex = reviews.indexWhere((review) => review.userName == userController.user.value.username);

            if (userReviewIndex != -1) {
              // If a matching review is found, move it to the front of the list
              final userReview = reviews.removeAt(userReviewIndex);
              reviews.insert(0, userReview); // Insert the user's review at the beginning of the list
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TOverAllProductRating(),
                TRatingBarIndicator(rating: reviewController.totalRating),
                Text(
                  reviews.length.toString(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const ReviewDivider(),
                ReviewForm(productId: productId,),
                const ReviewDivider(),
                const SizedBox(
                  height: 32,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => UserReviewCard(review: reviews[index],productId: productId,),
                    separatorBuilder: (context, index) => const SizedBox(height: 32,),
                    itemCount: reviews.length
                ),
              ],
            );
          }
        }
    );
  }
}



