
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/common_widgets/products/favorite_icon/t_favorite_icon.dart';
import 'package:t_store/common_widgets/products/products_card/product_card_add_to_cart_button.dart';
import 'package:t_store/common_widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:t_store/common_widgets/texts/t_product_price_text.dart';
import 'package:t_store/common_widgets/texts/t_product_title_text.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/enums.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';
import 'package:t_store/features/shop/product_details/presentation/views/product_details_view.dart';
import 'package:t_store/features/shop/product_details/presentation/views_model/product_controller.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final ProductController controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: (){
        Get.to(()=> ProductDetailsView(product: product,));
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width*0.4583,
        padding:const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: TColors.darkerGrey.withOpacity(0.1),
              blurRadius: 50,
              spreadRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          color: isDarkMode?TColors.darkerGrey:TColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TRoundedContainer(
              height: MediaQuery.sizeOf(context).height*0.2101,
              padding: const EdgeInsets.all(8),
              backGroundColor: isDarkMode? TColors.dark: TColors.light,
              child: Stack(
                children: [
                  Center(
                    child: TRoundedImage(
                      imageUrl: product.thumbnail,
                      backgroundColor: isDarkMode?
                      TColors.dark: TColors.light,
                      isNetworkImage: true,
                      shimmerWidth: MediaQuery.sizeOf(context).width*0.3819,
                      shimmerHeight: MediaQuery.sizeOf(context).height*0.1750,
                    ),
                  ),
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: 8,
                      backGroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      child: Text("$salePercentage%", style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: controller.isArabic() ? null : 0,
                    left: controller.isArabic() ? 0 : null,
                    child: TFavoriteIcon(productId: product.id,),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8,),
              Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: product.title,isSmallSize: true,),
                  const SizedBox(height: 8,),
                  TBrandTitleWithVerifiedIcon(title: product.brand?.name ?? "",),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child:  Text(
                            product.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),
                       Padding(
                        padding:  const EdgeInsets.only(left: 8.0),
                        child:  TProductPriceText(price: controller.getProductPrice(product),),
                      ),
                    ],
                  ),
                ),
                ProductCardAddToCartButton(product: product,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}







