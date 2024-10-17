import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/products/products_card/t_product_card_vertical.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/features/shop/all_products/presentation/views/all_products_view.dart';
import 'package:t_store/features/shop/home/model/category_model.dart';
import 'package:t_store/common_widgets/shimmer/t_vertical_product_shimmer.dart';
import 'package:t_store/features/shop/home/presentation/views_model/category_controller.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';
import 'package:t_store/features/shop/store/presentation/views/widget/category_brands.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    this.padding,
    required this.category,
  });
  final EdgeInsetsGeometry? padding;
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final CategoryController controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: padding ??
              EdgeInsets.only(
                right: MediaQuery.sizeOf(context).width * 0.0611,
                left: MediaQuery.sizeOf(context).width * 0.0611,
                top: MediaQuery.sizeOf(context).height * 0.0280,
                bottom: MediaQuery.sizeOf(context).height * 0.0280,
              ),
          child: Column(
            children: [
              CategoryBrands(category: category),
              const SizedBox(height: 16,),
              Column(
                children: [
                  TSectionHeading(
                      title: "You might like",
                    onPressed: () => Get.to(()=> AllProductsView(
                        title: category.name,
                      futureMethod: controller.fetchProductsForCategory(categoryId: category.id, limit: -1),
                    ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FutureBuilder<List<ProductModel>>(
                    future: controller.fetchProductsForCategory(categoryId: category.id),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<ProductModel>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const TVerticalProductShimmer();
                      }
                      else if (!snapshot.hasData || snapshot.data == null || (snapshot.data?.isEmpty ?? true)) {
                        return const Center(
                          child: Text("No Data Found"),
                        );
                      }
                      else if (snapshot.hasError) {
                        return const Center(
                          child: Text("Something went wrong."),
                        );
                      }
                      else {
                        final List<ProductModel> products = snapshot.data!;
                        return TGridLayout(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return TProductCardVertical(
                              product: product,
                            );
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            
            ],
          ),
        ),
      ],
    );
  }
}
