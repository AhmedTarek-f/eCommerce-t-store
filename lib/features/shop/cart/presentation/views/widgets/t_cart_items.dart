import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/texts/t_product_price_text.dart';
import 'package:t_store/features/shop/cart/presentation/views/widgets/t_cart_item.dart';
import 'package:t_store/features/shop/cart/presentation/views/widgets/t_product_quantity_with_add_remove_button.dart';
import 'package:t_store/features/shop/cart/presentation/views_model/cart_controller.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });
  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return Obx(
        () => ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 32,),
        itemCount: cartController.cartItems.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Obx(
              (){
                final cartItem = cartController.cartItems[index];
                return Column(
                  children: [
                    TCartItem(cartItem: cartItem,),
                    if(showAddRemoveButtons) const SizedBox(height: 16,),
                    if(showAddRemoveButtons) Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: MediaQuery.sizeOf(context).width*0.1527+32,),
                            TProductQuantityWithAddRemoveButton(
                              quantity: cartItem.quantity,
                              add: () => cartController.addOneToCart(cartItem),
                              remove: () => cartController.removeOneFromCart(cartItem),
                            ),
                          ],
                        ),
                        TProductPriceText(price: (cartItem.price * cartItem.quantity).toStringAsFixed(1)),
                      ],
                    ),
                  ],
                );
              },
          );
        },
      ),
    );
  }
}
