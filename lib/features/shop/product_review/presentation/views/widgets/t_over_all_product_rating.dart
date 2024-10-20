import 'package:flutter/material.dart';
import 'package:t_store/features/shop/product_review/presentation/views/widgets/t_rating_progress_indicator.dart';
import 'package:t_store/features/shop/product_review/presentation/views_model/product_review_controller.dart';

class TOverAllProductRating extends StatelessWidget {
  const TOverAllProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ProductReviewController reviewController = ProductReviewController.instance;
    return Row(
      children: [
        Expanded(flex: 3, child: Text(reviewController.totalRating.toString(),style: Theme.of(context).textTheme.displayLarge,)),
         Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(text: "5",value: reviewController.rating5,),
              TRatingProgressIndicator(text: "4",value: reviewController.rating4,),
              TRatingProgressIndicator(text: "3",value: reviewController.rating3,),
              TRatingProgressIndicator(text: "2",value: reviewController.rating2,),
              TRatingProgressIndicator(text: "1",value: reviewController.rating1,),
            ],
          ),
        )
      ],
    );
  }
}