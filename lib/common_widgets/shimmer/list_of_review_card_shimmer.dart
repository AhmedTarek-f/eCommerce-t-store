import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/user_review_card_shimmer.dart';

class ListOfReviewCardShimmer extends StatelessWidget {
  const ListOfReviewCardShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => const UserReviewCardShimmer(),
        separatorBuilder: (context, index) =>  const SizedBox(height: 32,),
        itemCount: 7
    );
  }
}