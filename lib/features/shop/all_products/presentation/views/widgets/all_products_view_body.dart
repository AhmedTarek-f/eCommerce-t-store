import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/products/sortable/t_sortable_products.dart';
import 'package:t_store/features/shop/all_products/presentation/views_model/all_products_controller.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_vertical_product_shimmer.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';

class AllProductsViewBody extends StatelessWidget {
  const AllProductsViewBody({super.key, this.query, this.futureMethod});
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;
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
    final AllProductsController controller = Get.put(AllProductsController());
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width*0.0611,
          left: MediaQuery.sizeOf(context).width*0.0611,
          top: MediaQuery.sizeOf(context).height*0.0280,
          bottom: MediaQuery.sizeOf(context).height*0.0280,
        ),
        child: FutureBuilder<List<ProductModel>>(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting) {
                return const TVerticalProductShimmer();
              }
              else if(!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty){
                return const Center(child:  Text("No Data Found!"),);
              }
              else if(snapshot.hasError)
                {
                  return const Center(child:  Text("Something went wrong."),);
                }
              else{
                final List<ProductModel> products = snapshot.data!;
                return TSortableProducts(searchListOptions: searchListOptions, products: products,);
              }
            },
        ),
      ),
    );
  }
}

