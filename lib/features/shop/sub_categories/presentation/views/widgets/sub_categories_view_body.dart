import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/common_widgets/products/products_card/t_product_card_horizontal.dart';
import 'package:t_store/common_widgets/shimmer/sub_category_shimmer.dart';
import 'package:t_store/common_widgets/shimmer/t_horizontal_product_shimmer.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/shop/all_products/presentation/views/all_products_view.dart';
import 'package:t_store/features/shop/home/model/category_model.dart';
import 'package:t_store/features/shop/home/presentation/views_model/category_controller.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';

class SubCategoriesViewBody extends StatelessWidget {
  const SubCategoriesViewBody({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final CategoryController controller = CategoryController.instance;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width * 0.0611,
          left: MediaQuery.sizeOf(context).width * 0.0611,
          top: MediaQuery.sizeOf(context).height * 0.0280,
          bottom: MediaQuery.sizeOf(context).height * 0.0280,
        ),
        child: FutureBuilder<List<CategoryModel>>(
          future: controller.getSubCategories(category.id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SubCategoryShimmer();
            }
            else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
              return const Center(child: Text("No Data Found!"),);
            }
            else if (snapshot.hasError) {
              return const Center(child: Text("Something went wrong."),);
            }
            else {
              final subCategories = snapshot.data!;
              return Column(
                children: [
                  TRoundedImage(
                    imageUrl: category.categoryBannerImg ?? "",
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height*0.2567,
                    isNetworkImage: true,
                  ),
                  const SizedBox(height: 32,),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(height: 16,),
                    itemCount: subCategories.length,

                    itemBuilder: (context, index) {
                      final subCategory = subCategories[index];
                      return FutureBuilder<List<ProductModel>>(
                        future: null,
                        builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const THorizontalProductShimmer();
                          }
                          else if (!snapshot.hasData || snapshot.data == null || snapshot.data!.isEmpty) {
                            return const Center(child: Text("No Data Found!"),);
                          }
                          else if (snapshot.hasError) {
                            return const Center(child: Text("Something went wrong."),);
                          }
                          else {
                            final products = snapshot.data!;
                            return  Column(
                              children: [
                                TSectionHeading(
                                  title: subCategory.name,
                                  showActionButton: true,
                                  padding: const EdgeInsets.all(0),
                                  onPressed: () => Get.to(()=> AllProductsView(title: subCategory.name,futureMethod: controller.fetchProductsForCategory(categoryId: subCategory.id,limit: -1),)),
                                ),
                                const SizedBox(height: 8,),
                                SizedBox(
                                  height:
                                  MediaQuery.sizeOf(context).height * 0.14,
                                  child: ListView.separated(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final product = products[index];
                                        return  TProductCardHorizontal(product: product,);
                                      },
                                      separatorBuilder: (context, index) => const SizedBox(width: 16,),
                                      itemCount: products.length
                                  ),
                                ),
                              ],
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}