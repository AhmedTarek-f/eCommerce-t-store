import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/t_horizontal_product_shimmer.dart';

class ListOfHorizontalProductShimmer extends StatelessWidget {
  const ListOfHorizontalProductShimmer({
    super.key, this.itemCount=3,
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => const THorizontalProductShimmer(),
      separatorBuilder: (context, index) => const SizedBox(height: 16,),
      itemCount: itemCount,
    );
  }
}
