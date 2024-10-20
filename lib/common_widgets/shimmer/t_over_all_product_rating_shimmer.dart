import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';

class TOverAllProductRatingShimmer extends StatelessWidget {
  const TOverAllProductRatingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 3, child: TShimmerEffect(height:100 ,width: 100,)),
        const SizedBox(width: 8,),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              TShimmerEffect(width: MediaQuery.sizeOf(context).width, height: 15),
              const SizedBox(height: 5,),
              TShimmerEffect(width: MediaQuery.sizeOf(context).width, height: 15),
              const SizedBox(height: 5,),
              TShimmerEffect(width: MediaQuery.sizeOf(context).width, height: 15),
              const SizedBox(height: 5,),
              TShimmerEffect(width: MediaQuery.sizeOf(context).width, height: 15),
              const SizedBox(height: 5,),
              TShimmerEffect(width: MediaQuery.sizeOf(context).width, height: 15),
            ],
          ),
        )
      ],
    );
  }
}
