import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/enums.dart';
import 'package:t_store/features/shop/cart/presentation/views_model/cart_controller.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';
import 'package:t_store/features/shop/product_details/presentation/views/product_details_view.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key, required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final CartController cartController = CartController.instance;
    return InkWell(
      onTap: () {
        if(product.productType == ProductType.single.toString()){
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        }
        else{
          Get.to(() => ProductDetailsView(product: product));
        }
      },
      child: Obx(
        () {
          final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
         return Container(
           decoration: BoxDecoration(
             color: productQuantityInCart >0 ? TColors.primaryColor :TColors.dark,
             borderRadius: const BorderRadius.only(
                 topLeft: Radius.circular(12),
                 bottomRight: Radius.circular(16)
             ),
           ),
           child: SizedBox(
             width:38.4 ,
             height:38.4 ,
             child: productQuantityInCart >0
                 ? Text(productQuantityInCart.toString(),style: Theme.of(context).textTheme.bodyLarge!.apply(color: TColors.white),)
                 :const Center(child: Icon(Iconsax.add_copy,color: TColors.white,)),
           ),
         );
        },
      ),
    );
  }
}
