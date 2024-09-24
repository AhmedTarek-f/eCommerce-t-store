import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/icons/t_circular_icon.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/core/app_router.dart';
import 'package:t_store/features/shop/wishlist/presentation/views/widgets/wishlist_view_body.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Wishlist",style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add_copy,onPressed: (){GoRouter.of(context).pushReplacement(AppRouter.kNavigationMenuView);},),

        ],
      ),
      body: const WishlistViewBody(),
    );
  }
}
