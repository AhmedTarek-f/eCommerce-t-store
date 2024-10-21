import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';
import 'package:t_store/core/constants/colors.dart';

class MyCouponItemShimmer extends StatelessWidget {
  const MyCouponItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: TColors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TShimmerEffect(width: MediaQuery.sizeOf(context).width*0.3, height: 15),
          const SizedBox(height: 16,),
          TShimmerEffect(width: MediaQuery.sizeOf(context).width, height: 15),
          const SizedBox(height: 8,),
          TShimmerEffect(width: MediaQuery.sizeOf(context).width*0.7, height: 15),
        ],
      ),
    );
  }
}
