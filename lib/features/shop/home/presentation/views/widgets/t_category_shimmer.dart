import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({
    super.key,
    this.itemCount =6
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: EdgeInsets.only(left: MediaQuery.sizeOf(context).width*0.0611),
        child: ListView.separated(
          itemCount: itemCount,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder:(context, index) => const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(height: 8,),
              TShimmerEffect(width: 55, height: 8)
            ],
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 16,),
        ),
      ),
    );
  }
}
