import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';
import 'package:t_store/core/constants/colors.dart';

class TBrandShimmer extends StatelessWidget {
  const TBrandShimmer({
    super.key,
    this.itemCount=4
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: itemCount,
      mainAxisExtent: 80,
      itemBuilder: (context, index) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color:TColors.grey),
          borderRadius: BorderRadius.circular(16),
          color: TColors.white,
        ),
        child: const Row(
          children: [
            TShimmerEffect(width: 56, height: 56,radius: 56,),
            SizedBox( width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: TShimmerEffect(width: 80, height: 8)),
                  SizedBox(height: 8,),
                  Flexible(child: TShimmerEffect(width: 40, height: 8)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
