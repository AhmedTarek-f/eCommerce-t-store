import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/icons/t_circular_icon.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/common_widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:t_store/common_widgets/texts/t_product_price_text.dart';
import 'package:t_store/common_widgets/texts/t_product_title_text.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/image_strings.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
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
                  imageUrl: TImages.productImage38,
                  applyImageRadius: true,
                  backgroundColor: isDarkMode? TColors.dark:TColors.white,
                ),
                Positioned(
                  top: 1,
                  child: TRoundedContainer(
                    radius: 8,
                    backGroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                    child: Text("25%", style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: TCircularIcon(icon: Iconsax.heart,color: Colors.red,width: 35,height: 35,size: 20,backgroundColor: isDarkMode?TColors.darkerGrey:TColors.lightGrey,),
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
                  const Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       TProductTitleText(title: "Green Nike Half Sleeves Shirt",isSmallSize: true,),
                       SizedBox(height: 8,),
                       TBrandTitleWithVerifiedIcon(title: "Nike",),
                     ],
                   ),
                  const Expanded(child: SizedBox()),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     const Flexible(child:TProductPriceText(price: "256.0")),
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
