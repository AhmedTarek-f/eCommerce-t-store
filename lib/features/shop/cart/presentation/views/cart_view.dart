import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/shop/cart/presentation/views/widgets/cart_view_body.dart';
import 'package:t_store/features/shop/checkout/presentation/views/checkout_view.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(title: Text("Cart",style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),
      body: const CartViewBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 24,left:24 ,bottom: 8),
        child: ElevatedButton(onPressed: (){
          Get.to(()=> const CheckoutView());
          },
            child: const Text("Checkout \$256.0")),
      ),
    );
  }
}
