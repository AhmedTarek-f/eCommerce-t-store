import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/products/products_card/t_product_card_vertical.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width*0.0611,
          left: MediaQuery.sizeOf(context).width*0.0611,
          top: MediaQuery.sizeOf(context).height*0.0280,
          bottom: MediaQuery.sizeOf(context).height*0.0280,
        ),
        child: Column(
          children: [
            TGridLayout(
                itemCount: 8,
                itemBuilder: (context, index) => const TProductCardVertical(),
            ),
          ],
        ),
      ),
    );
  }
}
