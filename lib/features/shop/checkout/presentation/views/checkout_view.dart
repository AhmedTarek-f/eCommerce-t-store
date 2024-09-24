import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/core/app_router.dart';
import 'package:t_store/core/constants/image_strings.dart';
import 'package:t_store/features/shop/checkout/presentation/views/widgets/checkout_view_body.dart';

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
              GoRouter.of(context).push(AppRouter.kSuccessScreen,
                  extra: {
                    "image":TImages.successfulPaymentIcon,
                    "title": "Payment Success!",
                    "subTitle": "Your item will be shipped soon!",
                    "onPressed": (){GoRouter.of(context).go(AppRouter.kNavigationMenuView);},
              },
              );
              },
            child: const Text("Checkout \$256.0"),
        ),
      ),
    );
  }
}
