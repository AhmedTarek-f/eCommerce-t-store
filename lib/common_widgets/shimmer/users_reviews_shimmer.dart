import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/list_of_review_card_shimmer.dart';
import 'package:t_store/common_widgets/shimmer/t_over_all_product_rating_shimmer.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';
import 'package:t_store/features/shop/product_review/presentation/views/widgets/review_divider.dart';
import 'package:t_store/features/shop/product_review/presentation/views/widgets/t_rating_bar_indicator.dart';

class UsersReviewsShimmer extends StatelessWidget {
  const UsersReviewsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TOverAllProductRatingShimmer(),
        const TRatingBarIndicator(rating: 0),
        const TShimmerEffect(width: 30, height: 15),
        const ReviewDivider(),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TRatingBarIndicator(rating: 0),
        ),
        TShimmerEffect(width: MediaQuery.sizeOf(context).width, height: 40),
        const Row(mainAxisAlignment:MainAxisAlignment.end,children: [TShimmerEffect(width: 60, height: 40)],),
        const ReviewDivider(),
        const SizedBox(
          height: 32,
        ),
        const ListOfReviewCardShimmer(),
      ],
    );
  }
}
