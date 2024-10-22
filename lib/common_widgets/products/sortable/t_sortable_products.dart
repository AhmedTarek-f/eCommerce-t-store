import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/products/products_card/t_product_card_vertical.dart';
import 'package:t_store/features/shop/all_products/presentation/views_model/all_products_controller.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final AllProductsController controller = Get.put(AllProductsController());
    controller.assignProduct(products);
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort_copy)),
          items: ["Name".tr, "Higher Price".tr, "Lower Price".tr, "Sale".tr, "Newest".tr, "Popularity".tr,]
              .map((searchItem) => DropdownMenuItem(value: searchItem,child: Text(searchItem),),).toList(),
          onChanged: (value){
            controller.sortProducts(value!);
          },
          value: controller.selectedSortOption.value,
        ),
        const SizedBox(height: 32,),
        Obx(
            ()=> TGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (context, index) => TProductCardVertical(product: controller.products[index],),
            ),
        ),
      ],
    );
  }
}
