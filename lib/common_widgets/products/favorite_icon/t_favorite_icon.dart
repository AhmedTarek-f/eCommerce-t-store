import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/icons/t_circular_icon.dart';
import 'package:t_store/features/shop/product_details/presentation/views_model/favorites_controller.dart';

class TFavoriteIcon extends StatelessWidget {
  const TFavoriteIcon({super.key, this.width, this.height, this.size, this.backgroundColor, required this.productId});
  final double? width ,height, size;
  final Color? backgroundColor;
  final String productId;
  @override
  Widget build(BuildContext context) {
    final FavoritesController controller = Get.put(FavoritesController());
    return Obx(
      ()=> TCircularIcon(
        icon: controller.isFavorite(productId)? Iconsax.heart : Iconsax.heart_copy,
        color: controller.isFavorite(productId)? Colors.red : null,
        width: width,
        height: height,
        size: size,
        backgroundColor: backgroundColor,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}