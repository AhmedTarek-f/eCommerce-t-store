import 'package:flutter/material.dart';
import 'package:t_store/features/shop/product_details/presentation/views/widgets/product_details_view_body.dart';
import 'package:t_store/features/shop/product_details/presentation/views/widgets/t_bottom_add_to_cart.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: ProductDetailsViewBody(),
    );
  }
}
