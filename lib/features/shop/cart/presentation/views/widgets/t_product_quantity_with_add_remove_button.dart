import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/icons/t_circular_icon.dart';
import 'package:t_store/core/constants/colors.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key, required this.quantity, this.add, this.remove,
  });
  final int quantity;
  final VoidCallback? add,remove;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus_copy,
          width: 32,
          height: 32,
          size: 16,
          color: isDarkMode?TColors.white:TColors.black,
          backgroundColor: isDarkMode? TColors.darkerGrey:TColors.light,
          onPressed: remove,
        ),
        const SizedBox(width: 16,),
        Text(quantity.toString(),style: Theme.of(context).textTheme.titleSmall,),
        const SizedBox(width: 16,),
        TCircularIcon(
          icon: Iconsax.add_copy,
          width: 32,
          height: 32,
          size: 16,
          color: TColors.white,
          backgroundColor: TColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
