import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/featrues/shop/navigation_menu/presentation/views_model/navigation_cubit.dart';
import 'package:t_store/featrues/shop/navigation_menu/presentation/views_model/navigation_states.dart';

class NavigationMenuView extends StatelessWidget {
  const NavigationMenuView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    NavigationCubit navigationCubit = BlocProvider.of<NavigationCubit>(context);
    return  Scaffold(
      bottomNavigationBar: BlocBuilder<NavigationCubit,NavigationStates>(
        builder: (context, state) => NavigationBar(
          backgroundColor: isDarkMode? TColors.black : TColors.white,
          indicatorColor: isDarkMode? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),
          height: 70,
          elevation: 0,
          selectedIndex: navigationCubit.selectedIndex,
          onDestinationSelected: (value) => navigationCubit.changeSelectedIndex(value),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home_copy), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop_copy), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart_copy), label: "WishList"),
            NavigationDestination(icon: Icon(Iconsax.user_copy), label: "Profile"),
          ]
        ),
      ),
      body: BlocBuilder<NavigationCubit,NavigationStates>(
          builder: (context, state) => navigationCubit.screens[navigationCubit.selectedIndex],
      ),
    );
  }
}
