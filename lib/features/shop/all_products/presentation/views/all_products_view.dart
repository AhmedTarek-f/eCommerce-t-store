import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/shop/all_products/presentation/views/widgets/all_products_view_body.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text("Popular Products",style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: const AllProductsViewBody(),
    );
  }
}
