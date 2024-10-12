import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount ;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        itemCount: itemCount,
        itemBuilder: (context, index) =>const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(width: 180, height: 180),
              SizedBox(height: 16,),
              TShimmerEffect(width: 160, height: 15),
              SizedBox(height: 8,),
              TShimmerEffect(width: 110, height: 15),
            ],
          ),
        ),
    );
  }
}
