import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/common_widgets/texts/t_brand_title_with_verified_icon.dart';
import 'package:t_store/common_widgets/texts/t_product_title_text.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/cart/model/cart_item_model.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key, required this.cartItem,
  });
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        TRoundedImage(
          imageUrl: cartItem.image ?? "",
          width: MediaQuery.sizeOf(context).width*0.1527,
          height: MediaQuery.sizeOf(context).height*0.0700,
          padding: const EdgeInsets.all(8),
          backgroundColor: isDarkMode? TColors.darkerGrey: TColors.light,
          isNetworkImage: true,
        ),
        const SizedBox(width: 16,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ""),
              TProductTitleText(title: cartItem.title,maxLines: 1,),
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {}) .entries.map(
                      (e) => TextSpan(
                        children: [
                          TextSpan(text:" ${e.key} ",style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(text: "${e.value} ",style: Theme.of(context).textTheme.bodyLarge),
                        ],
                      ),
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
