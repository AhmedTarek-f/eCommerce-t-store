import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/t_boxes_shimmer.dart';
import 'package:t_store/common_widgets/shimmer/t_list_tile_shimmer.dart';
import 'package:t_store/core/constants/colors.dart';

class TBrandShowCaseShimmer extends StatelessWidget {
  const TBrandShowCaseShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color:TColors.grey),
          borderRadius: BorderRadius.circular(16),
          color: TColors.white,
        ),
      child: const Column(
        children: [
          TListTileShimmer(),
          SizedBox(height: 16,),
          TBoxesShimmer(),
          SizedBox(height: 16,)
        ],
      ),
    );
  }
}
