import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_primary_header_container.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_search_container.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/products/products_card/t_product_card_vertical.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/shop/all_products/presentation/views/all_products_view.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_home_app_bar.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_home_categories.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_promo_slider.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_vertical_product_shimmer.dart';
import 'package:t_store/features/shop/product_details/presentation/views_model/product_controller.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.put(ProductController());
    return  SingleChildScrollView(
      child: Column(
        children: [
          const TPrimaryHeaderContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                THomeAppBar(),
                SizedBox(height: 32,),
                TSearchContainer(
                  text: "Search in Store",
                ),
                SizedBox(height: 32,),
                TSectionHeading(title: "Popular Categories",showActionButton: false,titleColor: Colors.white,),
                SizedBox(height: 16,),
                THomeCategories(),
                SizedBox(height: 32,)
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.sizeOf(context).width*0.0611,
                left: MediaQuery.sizeOf(context).width*0.0611,
                top: MediaQuery.sizeOf(context).height*0.0280,
                bottom: MediaQuery.sizeOf(context).height*0.0280,
              ),
              child: Column(
                children: [
                   const TPromoSlider(),
                   const SizedBox(height: 32,),
                   TSectionHeading(title: "Popular Products",
                     onPressed: (){
                     Get.to(()=> AllProductsView(
                       title: "Popular Products",
                       futureMethod: controller.fetchAllFeaturedProducts(),
                         ),
                       );
                     },
                   ),
                   const SizedBox(height: 16,),
                   Obx(
                       (){
                         if(controller.isLoading.value)
                           {
                             return const TVerticalProductShimmer();
                           }
                         else if (controller.featuredProductsList.isEmpty)
                           {
                             return Center(child: Text("No Data Found",style: Theme.of(context).textTheme.bodyMedium,));
                           }
                         else{
                           return TGridLayout(
                             itemCount: controller.featuredProductsList.length,
                             itemBuilder: (context, index) => TProductCardVertical(product: controller.featuredProductsList[index],),
                           );
                         }
                       }
                   ),
                ],
              )
          ),

        ],
      ),
    );
  }
}












