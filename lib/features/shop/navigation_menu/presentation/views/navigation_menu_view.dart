import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views_model/navigation_controller.dart';

class NavigationMenuView extends StatelessWidget {
  const NavigationMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navigationController = Get.put(NavigationController());
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return  Scaffold(
      bottomNavigationBar: Obx(
          () => NavigationBar(
              backgroundColor: isDarkMode? TColors.black : TColors.white,
              indicatorColor: isDarkMode? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
              height: 70,
              elevation: 0,
              selectedIndex: navigationController.selectedIndex.value,
              onDestinationSelected: (value) => navigationController.changeSelectedIndex(value),
              destinations:[
                NavigationDestination(icon: const Icon(Iconsax.home_copy), label: "Home".tr),
                NavigationDestination(icon: const Icon(Iconsax.shop_copy), label: "Store".tr),
                NavigationDestination(icon: const Icon(Iconsax.heart_copy), label: "WishList".tr),
                NavigationDestination(icon: const Icon(Iconsax.user_copy), label: "Profile".tr),
              ]
          )
      ),
      body: Obx(
          () => navigationController.screens[navigationController.selectedIndex.value],
      ),
    );
  }
}
