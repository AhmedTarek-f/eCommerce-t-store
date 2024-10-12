import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/common_widgets/products/favorite_icon/t_favorite_icon.dart';
import 'package:t_store/common_widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:t_store/common_widgets/texts/t_product_price_text.dart';
import 'package:t_store/common_widgets/texts/t_product_title_text.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/enums.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';
import 'package:t_store/features/shop/product_details/presentation/views_model/product_controller.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product,});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final ProductController controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    return Container(
      width: MediaQuery.sizeOf(context).width*0.7893,
      padding:const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isDarkMode?TColors.darkerGrey:TColors.softGrey,
      ),
      child: Row(
        children: [
          TRoundedContainer(
            height: MediaQuery.sizeOf(context).height*0.14,
            padding: const EdgeInsets.all(8),
            backGroundColor: isDarkMode? TColors.dark:TColors.white,
            child:  Stack(
              children: [
                TRoundedImage(
                  height: MediaQuery.sizeOf(context).height*0.14,
                  width: MediaQuery.sizeOf(context).width*0.3055,
                  imageUrl: product.thumbnail,
                  applyImageRadius: true,
                  backgroundColor: isDarkMode? TColors.dark:TColors.white,
                  isNetworkImage: true,
                ),
                Positioned(
                  top: 1,
                  child: TRoundedContainer(
                    radius: 8,
                    backGroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                    child: Text("$salePercentage%", style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: TFavoriteIcon(
                    width: 35,
                    height: 35,
                    size: 20,
                    backgroundColor: isDarkMode?TColors.darkerGrey:TColors.lightGrey, productId: product.id,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width*0.4379,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0,top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       TProductTitleText(title: product.title,isSmallSize: true,),
                       const SizedBox(height: 8,),
                       TBrandTitleWithVerifiedIcon(title: product.brand?.name?? "",),
                     ],
                   ),
                  const Expanded(child: SizedBox()),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Flexible(
                       child: Column(
                         children: [
                           if(product.productType == ProductType.single.toString() && product.salePrice < 0)
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
                     Container(
                       decoration: const BoxDecoration(
                         color: TColors.dark,
                         borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(12),
                             bottomRight: Radius.circular(16)
                         ),
                       ),
                       child: const SizedBox(
                         width:38.4 ,
                         height:38.4 ,
                         child:  Center(child: Icon(Iconsax.add_copy,color: TColors.white,)),
                       ),
                     ),
                   ],
                 )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
