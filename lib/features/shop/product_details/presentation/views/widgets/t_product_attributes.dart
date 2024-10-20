import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/choice_chip/t_choice_chip.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/texts/t_product_price_text.dart';
import 'package:t_store/common_widgets/texts/t_product_title_text.dart';
import 'package:t_store/common_widgets/texts/t_section_heading.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';
import 'package:t_store/features/shop/product_details/presentation/views_model/variation_controller.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final VariationController controller = VariationController.instance;
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(16),
              backGroundColor: isDarkMode ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Variation".tr, style: Theme.of(context).textTheme.headlineSmall,),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TProductTitleText(
                                title: "Price: ".tr,
                                isSmallSize: true,
                              ),
                              if (controller.selectedVariation.value.salePrice > 0)
                                Text(
                                  "\$${controller.selectedVariation.value.price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(decoration: TextDecoration.lineThrough),
                                ),
                              if (controller.selectedVariation.value.salePrice > 0) const SizedBox(width: 16,),
                              TProductPriceText(
                                price: controller.getVariationPrice(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              TProductTitleText(
                                title: "Stock: ".tr,
                                isSmallSize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value.tr,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  TProductTitleText(
                    title:
                        controller.selectedVariation.value.description ?? "",
                    isSmallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          const SizedBox(
            height: 16,
          ),
          Column(
            children: product.productAttributes!
                .map(
                  (attribute) => Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: attribute.name ?? "",
                          showActionButton: false,
                          padding: const EdgeInsets.all(0),
                        ),
                        const SizedBox(
                          height: 10.5,
                        ),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map(
                              (attributeValue) {
                                final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                                final available = controller.getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!)
                                    .contains(attributeValue);

                                return TChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available ? (selected) {
                                    if (selected && available) {
                                      controller.onAttributeSelected(product, attribute.name ?? "", attributeValue);
                                      }
                                    }
                                      : null,
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
