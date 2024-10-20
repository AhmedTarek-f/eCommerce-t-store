import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/images/t_circular_image.dart';
import 'package:t_store/common_widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:t_store/common_widgets/texts/t_product_price_text.dart';
import 'package:t_store/common_widgets/texts/t_product_title_text.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/enums.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';
import 'package:t_store/features/shop/product_details/presentation/views_model/product_controller.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final ProductController controller = ProductController.instance;
    final String? salesPercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radius: 8,
              backGroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
              child: Text("$salesPercentage%", style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),),
            ),
            const SizedBox(width: 16,),
            if(product.productType == ProductType.single.toString() && product.salePrice >0)
            Text("\$${product.price}",style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),),
            if(product.productType == ProductType.single.toString() && product.salePrice >0) const SizedBox(width: 16,),
            TProductPriceText(price: controller.getProductPrice(product),isLarge: true,),
          ],
        ),
        const SizedBox(height: 10.5,),
        TProductTitleText(title: product.title),
        const SizedBox(height: 10.5,),

        Row(
          children: [
            TProductTitleText(title: "Status".tr),
            const SizedBox(width: 16,),
            Text(controller.getProductStockStatus(product.stock).tr,style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        const SizedBox(height: 10.5,),
        Row(
          children: [
            TCircularImage(
              isNetworkImage: true,
              image: product.brand?.image ?? "",
              width: 32,
              height: 32,
              overlayColor: isDarkMode? TColors.white:TColors.black,
            ),
            const SizedBox(width: 4,),
            TBrandTitleWithVerifiedIcon(title: product.brand?.name ?? "",brandTextSize: TextSizes.medium,),
          ],
        ),
      ],
    );
  }
}
