import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/icons/t_circular_icon.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/cart/presentation/views_model/cart_controller.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
      decoration: BoxDecoration(
        color: isDarkMode? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        )
      ),
      child: Obx(
        ()=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Row(
                children: [
                   TCircularIcon(
                    icon: Iconsax.minus_copy,
                    backgroundColor:TColors.darkerGrey,
                    width: 40,
                    height: 40,
                    color: TColors.white,
                    onPressed: ()=> controller.productQuantityInCart.value <1 ? null : controller.productQuantityInCart.value -= 1,
                  ),
                  const SizedBox(width: 16,),
                  Text(controller.productQuantityInCart.value.toString(),style: Theme.of(context).textTheme.titleSmall,),
                  const SizedBox(width: 16,),
                   TCircularIcon(
                    icon: Iconsax.add_copy,
                    backgroundColor:TColors.black,
                    width: 40,
                    height: 40,
                    color: TColors.white,
                     onPressed: () => controller.productQuantityInCart.value +=1,
                  ),
                ],
              ),
           ElevatedButton(
             onPressed: controller.productQuantityInCart.value < 1? null : () => controller.addToCart(product),
             style: ElevatedButton.styleFrom(
               padding: const EdgeInsets.all(16),
               backgroundColor: TColors.black,
               side: const BorderSide(color: TColors.black)
             ),
             child:const Text("Add to Cart",),
           ),
          ],
        ),
      ),
    );
  }
}
