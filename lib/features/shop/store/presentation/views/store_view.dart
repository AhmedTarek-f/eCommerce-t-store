import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/products/cart/t_cart_counter_icon.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/shop/store/presentation/views/widget/store_view_body.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Store",style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCartCounterIcon(onPressed: (){}),
        ],
      ),
      body: const StoreViewBody(),
    );
  }
}
