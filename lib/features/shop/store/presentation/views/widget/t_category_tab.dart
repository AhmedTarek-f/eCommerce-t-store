import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/products/products_card/t_product_card_vertical.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/shop/store/presentation/views/widget/t_brand_show_case.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    this.padding,
  });
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children:[
        Padding(
          padding:padding?? EdgeInsets.only(
            right: MediaQuery.sizeOf(context).width*0.0611,
            left: MediaQuery.sizeOf(context).width*0.0611,
            top: MediaQuery.sizeOf(context).height*0.0280,
            bottom: MediaQuery.sizeOf(context).height*0.0280,
          ),
          child:   Column(
            children: [
              const TBrandShowCase(images: [TImages.productImage1,TImages.productImage2,TImages.productImage3],),
              const SizedBox(height: 16,),
              const TSectionHeading(title: "You might like"),
              const SizedBox(height: 16,),
              TGridLayout(itemCount: 4, itemBuilder: (context, index) => const TProductCardVertical(),)
            ],
          ),
        ),
      ] ,
    );
  }
}
