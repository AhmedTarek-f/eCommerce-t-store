import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/shop/all_products/presentation/views/widgets/all_products_view_body.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';

class AllProductsView extends StatelessWidget {
  const AllProductsView({
    super.key,
    required this.title,
    this.query,
    this.futureMethod
  });
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text(title,style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body: AllProductsViewBody(
        query: query,
        futureMethod: futureMethod,
      ),
    );
  }
}
