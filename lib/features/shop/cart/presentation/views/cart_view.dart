import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/core/app_router.dart';
import 'package:t_store/featrues/shop/cart/presentation/views/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TAppBar(title: Text("Cart",style: Theme.of(context).textTheme.headlineSmall,),showBackArrow: true,),
      body: const CartViewBody(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(right: 24,left:24 ,bottom: 8),
        child: ElevatedButton(onPressed: (){GoRouter.of(context).push(AppRouter.kCheckoutView);}, child: const Text("Checkout \$256.0")),
      ),
    );
  }
}
