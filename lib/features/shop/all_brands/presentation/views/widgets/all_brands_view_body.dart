import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/features/shop/brand_products/presentation/views/brand_products_view.dart';
import 'package:t_store/features/shop/store/presentation/views/widget/t_brand_card.dart';

class AllBrandsViewBody extends StatelessWidget {
  const AllBrandsViewBody({super.key});
  final List<String> searchListOptions = const [
    "Name",
    "Higher Price",
    "Lower Price",
    "Sale",
    "Newest",
    "Popularity",
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          right: MediaQuery.sizeOf(context).width * 0.0611,
          left: MediaQuery.sizeOf(context).width * 0.0611,
          top: MediaQuery.sizeOf(context).height * 0.0280,
          bottom: MediaQuery.sizeOf(context).height * 0.0280,
        ),
        child: Column(
          children: [
            const TSectionHeading(title: "Brands",padding: EdgeInsets.all(0),showActionButton: false,),
            const SizedBox(height: 32,),
            TGridLayout(
              itemCount: 10,
              mainAxisExtent: 80,
              itemBuilder: (context, index) => TBrandCard(showBorder: true,
                onTap: (){
                Get.to(()=> const BrandProductsView());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
