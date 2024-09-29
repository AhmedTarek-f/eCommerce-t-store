import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/common_widgets/icons/t_circular_icon.dart';
import 'package:t_store/common_widgets/t_app_bar/t_app_bar.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views/navigation_menu_view.dart';
import 'package:t_store/features/shop/wishlist/presentation/views/widgets/wishlist_view_body.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text("Wishlist",style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(
            icon: Iconsax.add_copy,
            onPressed: (){
              Get.off(()=> const NavigationMenuView());
              },
          ),

        ],
      ),
      body: const WishlistViewBody(),
    );
  }
}
