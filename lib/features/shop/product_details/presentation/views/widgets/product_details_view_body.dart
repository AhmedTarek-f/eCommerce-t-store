
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/enums.dart';
import 'package:t_store/features/shop/cart/presentation/views/cart_view.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';
import 'package:t_store/features/shop/product_details/presentation/views/widgets/t_product_attributes.dart';
import 'package:t_store/features/shop/product_details/presentation/views/widgets/t_product_image_slider.dart';
import 'package:t_store/features/shop/product_details/presentation/views/widgets/t_product_meta_data.dart';
import 'package:t_store/features/shop/product_details/presentation/views/widgets/t_rating_and_share.dart';
import 'package:t_store/features/shop/product_details/presentation/views_model/product_controller.dart';
import 'package:t_store/features/shop/product_review/presentation/views/product_review_view.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final ProductController productController = ProductController.instance;
    return  SingleChildScrollView(
      child: Column(
        children: [
          TProductImageSlider(product: product,),

          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.sizeOf(context).width*0.0611,
              left: MediaQuery.sizeOf(context).width*0.0611,
              bottom: MediaQuery.sizeOf(context).height*0.0280,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TRatingAndShare(),
                TProductMetaData(product: product,),
                if(product.productType == ProductType.variable.toString()) TProductAttributes(product: product,),
                if(product.productType == ProductType.variable.toString()) const SizedBox(height: 16,),
                if(product.productType == ProductType.single.toString()) const SizedBox(height: 16,),
                TSectionHeading(title: "Description".tr,showActionButton: false,padding: const EdgeInsets.all(0),),
                const SizedBox(height: 16,),
                 ReadMoreText(
                  product.description ?? "",
                  trimLength: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Show more".tr,
                  trimExpandedText: "Less".tr,
                  moreStyle: const TextStyle(fontSize: 14,fontWeight:  FontWeight.w800),
                  lessStyle: const TextStyle(fontSize: 14,fontWeight:  FontWeight.w800),
                ),
                const Divider(),
                const SizedBox(height: 16,),
                SizedBox(width:MediaQuery.sizeOf(context).width,child: ElevatedButton(onPressed: (){Get.off(()=>const CartView());}, child: Text("Checkout".tr))),
                const SizedBox(height: 16,),
                Row(
                  children: [
                    Expanded(child:  TSectionHeading(title: "Reviews".tr,showActionButton: false, padding: const EdgeInsets.all(0),)),
                    IconButton(
                        onPressed: (){
                          Get.to(()=> const ProductReviewView(),arguments: product.id);
                          },
                        icon: productController.isArabic() ? const Icon(Iconsax.arrow_left_2_copy,size: 18,) : const Icon(Iconsax.arrow_right_3_copy,size: 18,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


