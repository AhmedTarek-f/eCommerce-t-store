import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/texts/t_product_price_text.dart';
import 'package:t_store/featrues/shop/cart/presentation/views/widgets/t_cart_item.dart';
import 'package:t_store/featrues/shop/cart/presentation/views/widgets/t_product_quantity_with_add_remove_button.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });
  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 32,),
      itemCount: 2,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            const TCartItem(),
            if(showAddRemoveButtons) const SizedBox(height: 16,),
            if(showAddRemoveButtons) Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.1527+32,),
                    const TProductQuantityWithAddRemoveButton(),
                  ],
                ),
                const TProductPriceText(price: "256"),
              ],
            ),
          ],
        );
      },
    );
  }
}
