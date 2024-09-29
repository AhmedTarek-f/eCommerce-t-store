import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/icons/t_circular_icon.dart';
import 'package:t_store/core/constants/colors.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const TCircularIcon(
                icon: Iconsax.minus_copy,
                backgroundColor:TColors.darkerGrey,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
              const SizedBox(width: 16,),
              Text("2",style: Theme.of(context).textTheme.titleSmall,),
              const SizedBox(width: 16,),
              const TCircularIcon(
                icon: Iconsax.add_copy,
                backgroundColor:TColors.black,
                width: 40,
                height: 40,
                color: TColors.white,
              ),
            ],
          ),
         ElevatedButton(
           onPressed: (){},
           style: ElevatedButton.styleFrom(
             padding: const EdgeInsets.all(16),
             backgroundColor: TColors.black,
             side: const BorderSide(color: TColors.black)
           ),
           child:const Text("Add to Cart",),
         ),
        ],
      ),
    );
  }
}
