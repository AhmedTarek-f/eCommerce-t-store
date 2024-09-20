import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/curved_edges/t_curved_edges_widget.dart';
import 'package:t_store/common_widgets/icons/t_circular_icon.dart';
import 'package:t_store/common_widgets/images/t_rounded_image.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/image_strings.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                child: Image.asset(
                  TImages.productImage38,height: 400,),
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
                    itemBuilder: (context, index) => TRoundedImage(
                      imageUrl: TImages.productImage39,
                      width: 80,
                      backgroundColor: isDarkMode? TColors.dark:TColors.white,
                      border: Border.all(color: TColors.primary),
                      padding:const EdgeInsets.all(8),
                    ),
                    separatorBuilder: (_, __) => const SizedBox(width: 16,),
                    itemCount: 6
                ),
              ),
            ),
            const TAppBar(
              showBackArrow: true,
              actions: [TCircularIcon(icon: Iconsax.heart,color: Colors.red,)],
            )
          ],
        ),
      ),
    );
  }
}
