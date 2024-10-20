import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/core/utlis/loaders/t_animation_loader_widget.dart';
import 'package:t_store/features/shop/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:t_store/features/shop/cart/presentation/views_model/cart_controller.dart';
import 'package:t_store/features/shop/checkout/presentation/views/checkout_view.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views/navigation_menu_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return  Scaffold(
      appBar: TAppBar(title: Text("My Cart".tr,style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),
      body: Obx(
      () {
        final emptyWidget = TAnimationLoaderWidget(
            text: "Whoops! Cart is EMPTY.".tr,
            animation: TImages.cartAnimation,
          showAction: true,
          actionText: "Let's fill it".tr,
          onActionPressed: (){
            Get.offAll(()=> const NavigationMenuView());
          } ,
        );
        return controller.cartItems.isEmpty? emptyWidget :const CartViewBody();
        },
      ),
      bottomNavigationBar: Obx(
          ()=> controller.cartItems.isEmpty? const SizedBox() :Padding(
          padding: const EdgeInsets.only(right: 24,left:24 ,bottom: 8),
          child: ElevatedButton(onPressed: (){
            Get.to(()=> const CheckoutView());
            },
              child:Text("${"Checkout".tr} \$${controller.totalCartPrice.value}"),),
        ),
      ),
    );
  }
}
