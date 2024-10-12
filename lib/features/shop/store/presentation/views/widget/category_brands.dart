import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/shimmer/t_brand_show_case_shimmer.dart';
import 'package:t_store/features/shop/all_brands/model/brand_model.dart';
import 'package:t_store/features/shop/all_brands/presentation/views_model/brand_controller.dart';
import 'package:t_store/features/shop/home/model/category_model.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';
import 'package:t_store/features/shop/store/presentation/views/widget/t_brand_show_case.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final BrandController controller  = BrandController.instance;
    return FutureBuilder<List<BrandModel>>(
      future: controller.getBrandsForCategory(category.id),
      builder: (BuildContext context, AsyncSnapshot<List<BrandModel>> snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const TBrandShowCaseShimmer();
        }
        else if(!snapshot.hasData || snapshot.data == null || (snapshot.data?.isEmpty ?? true))
        {
          return const Center(child: Text("No Data Found"),);
        }
        else if(snapshot.hasError)
        {
          return const Center(child:  Text("Something went wrong."),);
        }
        else {
          final List<BrandModel> listOfBrands = snapshot.data!;
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final brand = listOfBrands[index];
              return FutureBuilder<List<ProductModel>>(
                future: controller.getBrandProducts(brandId: brand.id,limit: 3),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const TBrandShowCaseShimmer();
                  }
                  else if(!snapshot.hasData || snapshot.data == null || (snapshot.data?.isEmpty ?? true))
                  {
                    return const Center(child: Text("No Data Found"),);
                  }
                  else if(snapshot.hasError)
                  {
                    return const Center(child:  Text("Something went wrong."),);
                  }
                  else
                  {
                    final List<ProductModel> listOfProducts = snapshot.data!;
                    final List<String> productsImages = listOfProducts.map((product) => product.thumbnail).toList();
                    return TBrandShowCase(
                      images: productsImages, brand: brand,
                    );
                  }
                },
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 16,),
            itemCount: listOfBrands.length,
          );
        }
      },
    );

  }
}