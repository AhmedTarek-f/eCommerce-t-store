import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/my_coupon_item_shimmer.dart';

class MyCouponsListShimmer extends StatelessWidget {
  const MyCouponsListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.sizeOf(context).width*0.0611,
        left: MediaQuery.sizeOf(context).width*0.0611,
        top: MediaQuery.sizeOf(context).height*0.0280,
        bottom: MediaQuery.sizeOf(context).height*0.0280,
      ),
      child: ListView.separated(
          itemBuilder: (context, index) => const MyCouponItemShimmer(),
          separatorBuilder: (context, index) => const SizedBox(height: 16,),
          itemCount: 7
      ),
    );
  }
}
