import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/products/products_card/t_product_card_vertical.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_animation_loader_widget.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_vertical_product_shimmer.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views_model/navigation_controller.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';
import 'package:t_store/features/shop/product_details/presentation/views_model/favorites_controller.dart';

class WishlistViewBody extends StatelessWidget {
  const WishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavoritesController.instance;
    return SingleChildScrollView(
      child:  Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width*0.0611,
          left: MediaQuery.sizeOf(context).width*0.0611,
          top: MediaQuery.sizeOf(context).height*0.0280,
          bottom: MediaQuery.sizeOf(context).height*0.0280,
        ),
        child: Obx(
            ()=> FutureBuilder<List<ProductModel>>(
              future: controller.favoriteProducts(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const TVerticalProductShimmer();
                }
                else if(!snapshot.hasData || snapshot.data == null || (snapshot.data?.isEmpty ?? true))
                {
                  return TAnimationLoaderWidget(
                      text: "Whoops! Wishlist is Empty...",
                      animation: TImages.pencilAnimation,
                    showAction: true,
                    actionText: "Let's add some",
                    onActionPressed: () {
                      NavigationController.instance.changeSelectedIndex(0);
                    },
                  );
                }
                else if(snapshot.hasError)
                {
                  return const Center(child:  Text("Something went wrong."),);
                }
                else{
                  final products = snapshot.data!;
                  return TGridLayout(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                   return  TProductCardVertical(product: product,);
                  },
                );
                }
              },
            ),
        ),
      ),
    );
  }
}

