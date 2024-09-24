import 'package:flutter/material.dart';
import 'package:t_store/featrues/shop/product_review/presentation/views/widgets/t_over_all_product_rating.dart';
import 'package:t_store/featrues/shop/product_review/presentation/views/widgets/t_rating_bar_indicator.dart';
import 'package:t_store/featrues/shop/product_review/presentation/views/widgets/user_review_card.dart';

class ProductReviewViewBody extends StatelessWidget {
  const ProductReviewViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width*0.0611,
          left: MediaQuery.sizeOf(context).width*0.0611,
          bottom: MediaQuery.sizeOf(context).height*0.0280,
          top: MediaQuery.sizeOf(context).height*0.0280,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Rating and reviews are verified and are from people who use the same type of device that you use. "),
            const SizedBox(height: 16,),
            
            const TOverAllProductRating(),
            const TRatingBarIndicator(rating: 4.5),
            Text("12,300",style: Theme.of(context).textTheme.bodySmall,),
            const SizedBox(height: 32,),
            const UserReviewCard(),
            const SizedBox(height: 32,),
            const UserReviewCard(),
            const SizedBox(height: 32,),
            const UserReviewCard(),
          ],
        ),
      ),
    );
  }
}



