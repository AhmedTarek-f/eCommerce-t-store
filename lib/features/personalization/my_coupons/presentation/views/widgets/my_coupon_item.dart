import 'package:flutter/material.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/personalization/my_coupons/model/coupons_model.dart';

class MyCouponItem extends StatelessWidget {
  const MyCouponItem({super.key, required this.coupon});
  final CouponsModel coupon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: TColors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(coupon.couponOffer, style: Theme.of(context).textTheme.headlineSmall,),
          const SizedBox(height: 16,),
          Text(coupon.couponDescription),
        ],
      ),
    );
  }
}
