import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';
import 'package:t_store/features/shop/product_review/model/product_review_model.dart';
import 'package:t_store/features/shop/product_review/presentation/views/widgets/t_rating_bar_indicator.dart';
import 'package:t_store/features/shop/product_review/presentation/views_model/product_review_controller.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key, required this.review, required this.productId});
  final ProductReviewModel review;
  final String productId;
  @override
  Widget build(BuildContext context) {
    final UserController userController = UserController.instance;
    final ProductReviewController reviewController = ProductReviewController.instance;
    return  Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: TColors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        review.userImage!,
                    ),
                  ),
                  const SizedBox(width: 16,),
                  Text(review.userName, style: Theme.of(context).textTheme.titleLarge,)
                ],
              ),
              if(userController.user.value.username == review.userName) PopupMenuButton<String>(
                onSelected: (value) async{
                  if (value == 'delete') {
                    await reviewController.deleteUserReview(productId: productId);
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        SizedBox(width: 8),
                        Text('Delete Review'),
                      ],
                    ),
                  ),
                ],
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          const SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TRatingBarIndicator(rating: review.rating),
                Text(DateFormat('yyyy-MM-dd').format(review.reviewDate).toString(),style: Theme.of(context).textTheme.bodyMedium,),
              ],
            ),
          ),
          const SizedBox(height: 8,),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: ReadMoreText(
               review.comment,
              trimMode: TrimMode.Line,
              trimLength: 2,
              trimExpandedText: " show less",
              trimCollapsedText: " show more",
              moreStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
              lessStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                       ),
           ),
        ],
      ),
    );
  }
}



/*
*  const SizedBox(height: 16,),
        TRoundedContainer(
          backGroundColor: isDarkMode ? TColors.darkerGrey :TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("T's Store",style: Theme.of(context).textTheme.titleMedium,),
                    Text("25 Sept, 2024",style: Theme.of(context).textTheme.titleMedium,),
                  ],
                ),
                const SizedBox(height: 16,),
                const ReadMoreText(
                  "The user interface of the app is quite intuitive. I was able to navigate and make purchases seamlessly. Great jop!",
                  trimMode: TrimMode.Line,
                  trimLength: 2,
                  trimExpandedText: " show less",
                  trimCollapsedText: " show more",
                  moreStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                  lessStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: TColors.primary),
                ),
              ],
            ),
          ),
        )
* */