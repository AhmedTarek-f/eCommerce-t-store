import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_promo_slider_shimmer.dart';
import 'package:t_store/features/shop/home/presentation/views_model/banner_controller.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final BannerController controller = Get.put(BannerController());
    return Obx(
      () {
        if(controller.isLoading.value){
          return const TPromoSliderShimmer();
        }
        else if(controller.allActiveBanners.isEmpty){
          return Center(child: Text("No Data Found",style:  Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
        }
        else {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index,_) => controller.updateImageIndex(index),
                ),
                items: controller.allActiveBanners.map((banner)=>TRoundedImage(imageUrl: banner.imageUrl,shimmerWidth: MediaQuery.sizeOf(context).width,shimmerHeight: 80,isNetworkImage: true,)).toList(),
              ),
              const SizedBox(height: 16,),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for(int i=0; i<controller.allActiveBanners.length;i++) TRoundedContainer(width: 20, height: 4, radius: 24,backGroundColor:controller.currentImageIndex.value == i? TColors.primaryColor:TColors.grey,margin: const EdgeInsets.only(right: 10),)
                  ],
                ),
              )
            ],
          );
        }
      },
    );
  }
}

