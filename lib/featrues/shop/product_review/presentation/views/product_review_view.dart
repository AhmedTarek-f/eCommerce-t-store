import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/featrues/shop/product_review/presentation/views/widgets/product_review_view_body.dart';

class ProductReviewView extends StatelessWidget {
  const ProductReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text("Reviews & Ratings",),
        showBackArrow: true,
      ),
      body: ProductReviewViewBody(),
    );
  }
}
