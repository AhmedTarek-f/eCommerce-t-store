import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/featrues/shop/product_details/presentation/views/widgets/t_product_attributes.dart';
import 'package:t_store/featrues/shop/product_details/presentation/views/widgets/t_product_image_slider.dart';
import 'package:t_store/featrues/shop/product_details/presentation/views/widgets/t_product_meta_data.dart';
import 'package:t_store/featrues/shop/product_details/presentation/views/widgets/t_rating_and_share.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
        children: [
          const TProductImageSlider(),

          Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.sizeOf(context).width*0.0611,
              left: MediaQuery.sizeOf(context).width*0.0611,
              bottom: MediaQuery.sizeOf(context).height*0.0280,
            ),
            child: Column(
              children: [
                const TRatingAndShare(),
                const TProductMetaData(),
                const TProductAttributes(),
                const SizedBox(height: 32,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text("Checkout"),
                    ),
                ),
                const SizedBox(height: 32,),
                const TSectionHeading(title: "Description",showActionButton: false,padding: EdgeInsets.all(0),),
                const SizedBox(height: 16,),
                const ReadMoreText(
                  "This is a product description for blue nike shoes. There are more things that can be added but I'm aaaaa adfff adfdsg sdfdsfffff afdsffffff dsf",
                  trimLength: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: "Show more",
                  trimExpandedText: "Less",
                  moreStyle: TextStyle(fontSize: 14,fontWeight:  FontWeight.w800),
                  lessStyle: TextStyle(fontSize: 14,fontWeight:  FontWeight.w800),
                ),
                const Divider(),
                const SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TSectionHeading(title: "Reviews (199)",showActionButton: false, padding: EdgeInsets.all(0),),
                    IconButton(onPressed: (){}, icon: const Icon(Iconsax.arrow_right_3_copy,size: 18,)),
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


