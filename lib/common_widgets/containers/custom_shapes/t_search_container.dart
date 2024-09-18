import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/core/constants/colors.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key, this.icon = Iconsax.search_normal_copy, required this.text,  this.showBackGround = true,  this.showBorder = true, this.onTap, this.padding,
  });
  final IconData? icon;
  final String text;
  final bool showBackGround,showBorder;
  final void Function()? onTap;
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness==Brightness.dark;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:padding??  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.0611),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: showBackGround? isDarkMode? TColors.dark:TColors.light: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: showBorder? Border.all(color: TColors.grey): null,
          ),
          child:Row(
            children: [
              Icon(icon, color:isDarkMode?TColors.grey :TColors.darkerGrey,),
              const SizedBox(width: 16,),
              Text(text,style: Theme.of(context).textTheme.bodySmall,)
            ],
          ),
        ),
      ),
    );
  }
}
