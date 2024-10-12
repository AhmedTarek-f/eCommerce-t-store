import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/shop/all_brands/model/brand_model.dart';
import 'package:t_store/features/shop/brand_products/presentation/views/widgets/brand_products_view_body.dart';

class BrandProductsView extends StatelessWidget {
  const BrandProductsView({super.key, required this.brandData});
  final BrandModel brandData;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text(brandData.name),
        showBackArrow: true,
      ),
      body: BrandProductsViewBody(brandData: brandData,),
    );
  }
}
