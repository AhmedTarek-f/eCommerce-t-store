import 'package:flutter/material.dart';
import 'package:t_store/common_widgets/images/t_circular_image.dart';
import 'package:t_store/core/constants/colors.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backGroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });
  final String image , title;
  final Color textColor;
  final Color? backGroundColor;
  final void Function()? onTap;
  final bool isNetworkImage ;
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 56,
            width: 56,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: backGroundColor ?? (isDarkMode? TColors.black : TColors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child: TCircularImage(
              image: image,
              isNetworkImage: isNetworkImage,
              fit: BoxFit.fitWidth,
              overlayColor: isDarkMode?TColors.light:TColors.dark,
            ),
          ),

          const SizedBox(height: 8,),
          SizedBox(
            width:55,
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
