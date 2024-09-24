import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/images/t_circular_image.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/image_strings.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key, this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const TCircularImage(width: 50,height: 50,image: TImages.user,padding: EdgeInsets.zero,isOverLayColor: false,),
      title: Text("Ahmed Tarek",style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white )),
      subtitle: Text("o0ahmedtarek0o@gmail.com",style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white ),),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit_copy),color: TColors.white,),

    );
  }
}