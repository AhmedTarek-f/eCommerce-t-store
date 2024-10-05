import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/common_widgets/containers/custom_shapes/t_shimmer_effect.dart';
import 'package:t_store/common_widgets/products/cart/t_cart_counter_icon.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/personalization/controller/user_controller.dart';
import 'package:t_store/features/shop/cart/presentation/views/cart_view.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserController controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good day for shopping",style: Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey),),
          Obx(
            () {
              if(controller.profileLoading.value)
                {
                 return const TShimmerEffect(width: 80,height: 15,);
                }
              else
                {
                  return Text(controller.user.value.fullName,style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),);
                }
            },
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: (){
            Get.to(()=>const CartView());
          },
        ),
      ],
    );
  }
}
