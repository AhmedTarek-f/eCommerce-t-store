import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/icons/t_circular_icon.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/common_widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:t_store/common_widgets/texts/t_product_price_text.dart';
import 'package:t_store/common_widgets/texts/t_product_title_text.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/shop/product_details/presentation/views/product_details_view.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: (){
        Get.to(()=> const ProductDetailsView());
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
          children: [
            TRoundedContainer(
              height: MediaQuery.sizeOf(context).height*0.2101,
              padding: const EdgeInsets.all(8),
              backGroundColor: isDarkMode? TColors.dark: TColors.light,
              child: Stack(
                children: [
                  TRoundedImage(imageUrl: TImages.productImage38,backgroundColor: isDarkMode? TColors.dark: TColors.light,),
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: 8,
                      backGroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                      child: Text("25%", style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart,color: Colors.red,),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8,),
             const Padding(
              padding:EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: "Green Nike Air Shoes",isSmallSize: true,),
                  SizedBox(height: 8,),
                  TBrandTitleWithVerifiedIcon(title: "Nike",),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding:  EdgeInsets.only(left: 8.0),
                  child:  TProductPriceText(price: "35.5",),
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
            ),
          ],
        ),
      ),
    );
  }
}





