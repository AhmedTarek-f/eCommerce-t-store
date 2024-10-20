import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/layouts/t_grid_layout.dart';
import 'package:t_store/common_widgets/products/products_card/t_product_card_vertical.dart';
import 'package:t_store/common_widgets/shimmer/t_vertical_product_shimmer.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/search_in_store/presentation/views_model/search_in_store_controller.dart';

class SearchInStoreViewBody extends StatelessWidget {
  const SearchInStoreViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final SearchInStoreController controller = Get.put(SearchInStoreController());
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.sizeOf(context).width * 0.0611,
        left: MediaQuery.sizeOf(context).width * 0.0611,
        top: MediaQuery.sizeOf(context).height * 0.0280,
        bottom: MediaQuery.sizeOf(context).height * 0.0280,
      ),
      child: Obx(
          ()=> Column(
          children: [
            Obx(
              () => TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: isDarkMode ? Colors.white : Colors.black),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Search by product name",
                  hintStyle: const TextStyle(color: TColors.darkGrey,fontSize: 14),
                  contentPadding: const EdgeInsets.only(left: 24,bottom:16 ,right:16 ,top:16 )
                ),
                onChanged: (value) {
                  controller.searchForAProduct(value);
                },
                enabled: !controller.isLoading.value,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            controller.productsSearchList.isEmpty
                ? Obx(() {
                  if (controller.isLoading.value) {
                    return const Expanded(child:  TVerticalProductShimmer());
                  } else {
                    return Expanded(
                      child: TGridLayout(
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) => TProductCardVertical(
                            product: controller.products[index]),
                        shrinkWrap: false,
                        physics: const BouncingScrollPhysics(),
                      ),
                    );
                  }
                })
                : Obx(() {
                  return Expanded(
                    child: TGridLayout(
                      itemCount: controller.productsSearchList.length,
                      itemBuilder: (context, index) => TProductCardVertical(
                          product: controller.productsSearchList[index]),
                      shrinkWrap: false,
                      physics: const BouncingScrollPhysics(),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
