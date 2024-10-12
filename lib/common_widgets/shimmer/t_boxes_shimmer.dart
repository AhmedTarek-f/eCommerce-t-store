import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(width: 16,),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(width: 16,),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
