import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/products/sortable/t_sortable_products.dart';

class AllProductsViewBody extends StatelessWidget {
  const AllProductsViewBody({super.key});

  final List<String> searchListOptions = const [
    "Name",
    "Higher Price",
    "Lower Price",
    "Sale",
    "Newest",
    "Popularity",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width*0.0611,
          left: MediaQuery.sizeOf(context).width*0.0611,
          top: MediaQuery.sizeOf(context).height*0.0280,
          bottom: MediaQuery.sizeOf(context).height*0.0280,
        ),
        child: TSortableProducts(searchListOptions: searchListOptions),
      ),
    );
  }
}

