import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/products/cart/t_cart_counter_icon.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/core/constants/colors.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good day for shopping",style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
          Text("Ahmed Tarek",style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),)
        ],
      ),
      actions: [
        TCartCounterIcon( onPressed: (){},)
      ],
    );
  }
}
