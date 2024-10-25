
import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/list_of_horizontal_product_shimmer.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';

class SubCategoryShimmer extends StatelessWidget {
  const SubCategoryShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TShimmerEffect(width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height*0.2567),
        const SizedBox(height: 32,),
        const ListOfHorizontalProductShimmer(),
      ],
    );
  }
}