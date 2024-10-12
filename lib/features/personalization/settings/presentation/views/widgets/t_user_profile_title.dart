import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/shimmer/t_shimmer_effect.dart';
import 'package:t_store/common_widgets/images/t_circular_image.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';
import 'package:t_store/features/shop/home/presentation/views/widgets/t_home_app_bar.dart';

class TUserProfileTitle extends StatelessWidget {
  const TUserProfileTitle({
    super.key,
    this.onPressed,
  });
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final UserController controller = UserController.instance;
    return ListTile(
      leading: const TCircularImage(
        width: 50,
        height: 50,
        image: TImages.user,
        padding: EdgeInsets.zero,
        isOverLayColor: false,
      ),
      title: Obx(
        () {
          if (controller.profileLoading.value) {
            return const TShimmerEffect(width: 80, height: 15);
          } else {
            return controller.nameChangeLoading.value?Text(
              "Updating...",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            ) :Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white),
            );
          }
        },
      ),
      subtitle: Obx(
        () {
          if (controller.profileLoading.value) {
            return const TShimmerEffect(width: 80, height: 15);
          } else {
            return Text(
              controller.user.value.email,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: TColors.white),
            );
          }
        },
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit_copy),
        color: TColors.white,
      ),
    );
  }
}
