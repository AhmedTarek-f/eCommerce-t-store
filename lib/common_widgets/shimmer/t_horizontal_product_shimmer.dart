import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({super.key, this.itemCount=4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom:  32),
      height: 120,
      child: ListView.separated(
        itemCount: itemCount,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(width: 16,),
        itemBuilder: (context, index) {
          return const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TShimmerEffect(width: 120, height: 120),
              SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 8,),
                  TShimmerEffect(width: 160, height: 15),
                  SizedBox(height: 8,),
                  TShimmerEffect(width: 110, height: 15),
                  SizedBox(height: 8,),
                  TShimmerEffect(width: 80, height: 15),
                  Spacer(),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
