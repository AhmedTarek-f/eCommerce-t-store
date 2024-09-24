import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/products/products_card/t_product_card_vertical.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/app_router.dart';
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
              itemBuilder: (context, index) => TBrandCard(showBorder: true,onTap: (){GoRouter.of(context).push(AppRouter.kBrandProductsView);},),
            ),
          ],
        ),
      ),
    );
  }
}
