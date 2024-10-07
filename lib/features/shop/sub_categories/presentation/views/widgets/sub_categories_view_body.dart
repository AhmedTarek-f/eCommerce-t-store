import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/common_widgets/products/products_card/t_product_card_horizontal.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/image_strings.dart';

class SubCategoriesViewBody extends StatelessWidget {
  const SubCategoriesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width*0.0611,
          left: MediaQuery.sizeOf(context).width*0.0611,
          top: MediaQuery.sizeOf(context).height*0.0280,
          bottom: MediaQuery.sizeOf(context).height*0.0280,
        ),
        child: Column(
          children: [
            TRoundedImage(imageUrl: TImages.promoBanner3,width: MediaQuery.sizeOf(context).width,),
            const SizedBox(height: 32,),

            Column(
              children: [
                TSectionHeading(title: "Sport Shoes",showActionButton: true,padding: const EdgeInsets.all(0),onPressed: (){},),
                const SizedBox(height: 8,),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.14,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => const TProductCardHorizontal(),
                      separatorBuilder: (context, index) => const SizedBox(width: 16,),
                      itemCount: 10
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
