import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/shop/product_review/presentation/views/widgets/product_review_view_body.dart';
import 'package:t_store/features/shop/product_review/presentation/views_model/product_review_controller.dart';

class ProductReviewView extends StatelessWidget {
  const ProductReviewView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ProductReviewController());
    return  Scaffold(
      appBar: TAppBar(
        title: Text("Reviews & Ratings".tr,),
        showBackArrow: true,
      ),
      body: const ProductReviewViewBody(),
    );
  }
}
