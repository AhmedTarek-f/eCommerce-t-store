import 'package:flutter/material.dart';
import 'package:t_store/core/constants/colors.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key, required this.image, required this.title, this.textColor = TColors.white, this.backGroundColor, this.onTap,
  });
  final String image , title;
  final Color textColor;
  final Color? backGroundColor;
  final void Function()? onTap;
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
            child: Center(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                color:isDarkMode? TColors.light:TColors.dark,
              ),
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
