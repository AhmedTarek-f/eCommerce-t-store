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
        Expanded(flex: 3, child: FittedBox(fit: BoxFit.scaleDown, child: Text(reviewController.totalRating.toString(),style: Theme.of(context).textTheme.displayLarge,maxLines: 1,))),
         Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(text: "5",value: double.parse(reviewController.rating5.toString()) ,),
              TRatingProgressIndicator(text: "4",value: double.parse(reviewController.rating4.toString()),),
              TRatingProgressIndicator(text: "3",value: double.parse(reviewController.rating3.toString()),),
              TRatingProgressIndicator(text: "2",value: double.parse(reviewController.rating2.toString()),),
              TRatingProgressIndicator(text: "1",value: double.parse(reviewController.rating1.toString()),),
            ],
          ),
        )
      ],
    );
  }
}