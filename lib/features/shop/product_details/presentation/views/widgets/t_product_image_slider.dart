import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/products/favorite_icon/t_favorite_icon.dart';
import 'package:t_store/common_widgets/curved_edges/t_curved_edges_widget.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/product_details/model/product_model.dart';
import 'package:t_store/features/shop/product_details/presentation/views_model/image_controller.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key, required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final ImageController imageController = Get.put(ImageController());
    final List<String> images = imageController.getAllProductImages(product);
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TCurvedEdgedWidget(
      child: Container(
        color: isDarkMode? TColors.darkerGrey: TColors.light,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left:MediaQuery.sizeOf(context).width* 0.0814,
                right:MediaQuery.sizeOf(context).width* 0.0814,
                bottom:MediaQuery.sizeOf(context).height*0.0373,
                top:MediaQuery.sizeOf(context).height*0.0373,
              ),
              child: Center(
                child: Obx(
                    (){
                      final image = imageController.selectedProductImage.value;
                      return GestureDetector(
                        onTap: (){
                          imageController.showEnlargedImage(image);
                        },
                        child: CachedNetworkImage(
                          imageUrl: image,
                          height: 400,
                          progressIndicatorBuilder: (context, url, progress) => CircularProgressIndicator(value: progress.progress,color: TColors.primary,),
                          errorWidget: (context, url, error) => const Center(child:  Icon(Icons.error)),
                        ),
                      );
                    }
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              right: 0,
              left: 24,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>Obx(
                      (){
                        final isSelectedImage = imageController.selectedProductImage.value == images[index];
                        return TRoundedImage(
                          onPressed: ()=> imageController.selectedProductImage.value = images[index],
                          imageUrl: images[index],
                          width: 80,
                          backgroundColor: isDarkMode? TColors.dark:TColors.white,
                          border:Border.all(color:isSelectedImage? TColors.primary: Colors.transparent),
                          padding:const EdgeInsets.all(8),
                          isNetworkImage: true,
                          shimmerWidth: 80,
                          shimmerHeight: 80,
                        );
                      }
                    ),
                    separatorBuilder: (_, __) => const SizedBox(width: 16,),
                    itemCount: images.length
                ),
              ),
            ),
            TAppBar(
              showBackArrow: true,
              actions: [TFavoriteIcon(productId:product.id,)],
            )
          ],
        ),
      ),
    );
  }
}
