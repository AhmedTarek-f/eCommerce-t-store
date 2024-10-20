import 'package:flutter/material.dart';
import 'package:t_store/features/shop/product_review/presentation/views/widgets/users_reviews.dart';

class ProductReviewViewBody extends StatelessWidget {
  const ProductReviewViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width * 0.0611,
          left: MediaQuery.sizeOf(context).width * 0.0611,
          bottom: MediaQuery.sizeOf(context).height * 0.0280,
          top: MediaQuery.sizeOf(context).height * 0.0280,
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Rating and reviews are verified and are from people who use the same type of device that you use. "),
            SizedBox(
              height: 16,
            ),
      
            UsersReviews(),
          ],
        ),
      ),
    );
  }
}


