import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_primary_header_container.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_search_container.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/products/products_card/t_product_card_vertical.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/app_router.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_home_app_bar.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_home_categories.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_promo_slider.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
                   const TPromoSlider(banners: [TImages.promoBanner2,TImages.promoBanner3,TImages.promoBanner4,TImages.promoBanner1,TImages.promoBanner5,TImages.promoBanner6],),
                   const SizedBox(height: 32,),
                   TSectionHeading(title: "Popular Products",onPressed: (){GoRouter.of(context).push(AppRouter.kAllProductsView);},),
                   const SizedBox(height: 16,),
                   TGridLayout(
                     itemCount: 4,
                     itemBuilder: (context, index) => const TProductCardVertical(),
                   ),
                ],
              )
          ),

        ],
      ),
    );
  }
}












