import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/cart/presentation/views/cart_view.dart';
import 'package:t_store/features/shop/cart/presentation/views_model/cart_controller.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key, this.iconColor,
  });
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    final CartController controller = Get.put(CartController());
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(()=>const CartView()),
            icon: Icon(
              Iconsax.shopping_bag_copy,
              color: iconColor?? (isDarkMode?TColors.light:TColors.black),
            ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius:  BorderRadius.circular(100),
            ),
            child: Center(
                child: Obx(
                  () => Text(
                    controller.noOfCartItems.value.toString(),
                    style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.white,fontSizeFactor: 0.8),
                  ),
                ),
            ),
          ),
        )
      ],
    );
  }
}
