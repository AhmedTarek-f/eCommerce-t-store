import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/success_screen.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/shop/checkout/presentation/views/widgets/checkout_view_body.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views/navigation_menu_view.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(
        title: Text("Order Review",style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),
      body:const CheckoutViewBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 24,left:24 ,bottom: 8),
        child: ElevatedButton(
            onPressed: (){
              Get.to(()=> SuccessScreen(
                image: TImages.successfulPaymentIcon,
                title: "Payment Success!",
                subTitle: "Your item will be shipped soon!",
                onPressed: (){
                  Get.offAll(()=> const NavigationMenuView()
                  );
                },
              ));
              },
            child: const Text("Checkout \$256.0"),
        ),
      ),
    );
  }
}
