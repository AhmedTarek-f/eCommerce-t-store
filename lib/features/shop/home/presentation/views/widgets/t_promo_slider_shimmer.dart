import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/home/presentation/views_model/banner_controller.dart';

class TPromoSliderShimmer extends StatelessWidget {
  const TPromoSliderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final BannerController controller = BannerController.instance;
    return Obx(() => Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index,_) => controller.updateImageIndex(index),
          ),
          items: [
            TShimmerEffect(width: MediaQuery.sizeOf(context).width, height: 80),
            TShimmerEffect(width: MediaQuery.sizeOf(context).width, height: 80),
            TShimmerEffect(width: MediaQuery.sizeOf(context).width, height: 80),
            TShimmerEffect(width: MediaQuery.sizeOf(context).width, height: 80),
          ],
        ),
        const SizedBox(height: 16,),
        Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for(int i=0; i<4;i++) TRoundedContainer(width: 20, height: 4, radius: 24,backGroundColor:controller.currentImageIndex.value == i? TColors.primaryColor:TColors.grey,margin: const EdgeInsets.only(right: 10),)
            ],
          ),
        )
      ],
    ),);
  }
}
