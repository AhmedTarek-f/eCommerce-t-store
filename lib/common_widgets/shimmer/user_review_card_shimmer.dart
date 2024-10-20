import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/product_review/presentation/views/widgets/t_rating_bar_indicator.dart';

class UserReviewCardShimmer extends StatelessWidget {
  const UserReviewCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: TColors.grey),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TShimmerEffect(width: 60, height: 60,radius: 60,),
                  SizedBox(width: 16,),
                  TShimmerEffect(width: 160, height: 15),
                ],
              ),
              IconButton(onPressed:null, icon: Icon(Icons.more_vert)),
            ],
          ),
          SizedBox(height: 16,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TRatingBarIndicator(rating: 0),
              TShimmerEffect(width: 120, height: 15),
            ],
          ),
          SizedBox(height: 16,),
          TShimmerEffect(width: 200, height: 15),
          TShimmerEffect(width: 160, height: 15),
          TShimmerEffect(width: 120, height: 15),
        ],
      ),
    );
  }
}
