import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,
    this.icon,
    this.onPressed,
    required this.title,
    required this.value,
    this.showIcon = true,
    this.iconOnPressed,
  });
  final IconData? icon;
  final VoidCallback? onPressed,iconOnPressed;
  final String title , value;
  final bool showIcon;
  @override
  Widget build(BuildContext context) {
    final UserController userController = UserController.instance;
    return  GestureDetector(
      onTap: onPressed,
      child:Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 16/1.5,vertical: 8),
        child: Row(
          children: [
            Expanded(flex:3,child: Text(title,style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis,)),
            Expanded(flex:5,child: Text(value==""? "not provided yet." : value,style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,)),
            showIcon
                ? Expanded(
                child: GestureDetector(
                  onTap: iconOnPressed,
                    child: Icon(icon ?? (userController.isArabic()? Iconsax.arrow_left_2_copy :Iconsax.arrow_right_3_copy) ,size: 18,),
                ),)
                : const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
