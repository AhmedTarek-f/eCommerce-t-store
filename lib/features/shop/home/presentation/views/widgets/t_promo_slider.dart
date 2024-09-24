import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_rounded_container.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/home/presentation/views_model/home_cubit.dart';
import 'package:t_store/features/shop/home/presentation/views_model/home_states.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key, required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubitProvider =BlocProvider.of<HomeCubit>(context);
    return BlocBuilder<HomeCubit,HomeStates>(
      builder: (context, state) => Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged: (index,_) => homeCubitProvider.updateImageIndex(index),
            ),
            items: banners.map((imgUrl)=>TRoundedImage(imageUrl: imgUrl)).toList(),
          ),
          const SizedBox(height: 16,),
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for(int i=0; i<banners.length;i++) TRoundedContainer(width: 20, height: 4, radius: 24,backGroundColor:homeCubitProvider.currentImageIndex == i? TColors.primaryColor:TColors.grey,margin: const EdgeInsets.only(right: 10),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
