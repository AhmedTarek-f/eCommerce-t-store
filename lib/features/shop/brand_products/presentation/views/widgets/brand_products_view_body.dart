import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/products/sortable/t_sortable_products.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/all_brands/model/brand_model.dart';
import 'package:t_store/features/shop/all_brands/presentation/views_model/brand_controller.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_vertical_product_shimmer.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';
import 'package:t_store/features/shop/store/presentation/views/widget/t_brand_card.dart';

class BrandProductsViewBody extends StatelessWidget {
  const BrandProductsViewBody({super.key, required this.brandData});
  final BrandModel brandData;
  @override
  Widget build(BuildContext context) {
    final BrandController brandController = BrandController.instance;
    return SingleChildScrollView(
      child:  Padding(
        padding:  EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width * 0.0611,
          left: MediaQuery.sizeOf(context).width * 0.0611,
          top: MediaQuery.sizeOf(context).height * 0.0280,
          bottom: MediaQuery.sizeOf(context).height * 0.0280,
        ),
        child:  Column(
          children: [
            TBrandCard(showBorder: true, brandData: brandData,),
            const SizedBox(height: 32,),
            FutureBuilder<List<ProductModel>>(
                future: brandController.getBrandProducts(brandId: brandData.id),
                builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting)
                    {
                      return const TVerticalProductShimmer();
                    }
                  else if(!snapshot.hasData || (snapshot.data?.isEmpty ?? true) || snapshot.data == null) {
                    return const Center(child: Text("No Data Found!"),);
                  }
                  else{
                    final List<ProductModel> products = snapshot.data!;
                    return TSortableProducts(
                      products: products,
                    );
                  }
                },
            ),
          ],
        ),
      ),
    );
  }
}
