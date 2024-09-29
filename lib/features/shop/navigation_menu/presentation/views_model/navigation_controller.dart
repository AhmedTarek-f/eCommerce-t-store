import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/settings/presentation/views/settings_view.dart';
import 'package:t_store/features/shop/home/presentation/views/home_view.dart';
import 'package:t_store/features/shop/store/presentation/views/store_view.dart';
import 'package:t_store/features/shop/wishlist/presentation/views/wishlist_view.dart';

class NavigationController extends GetxController
{
  static NavigationController get instance => Get.find();

  int selectedIndex =0;
  void changeSelectedIndex(int value)
  {
    selectedIndex = value;
    update();
  }
  final List<Widget> screens = [
    const HomeView(),
    const StoreView(),
    const WishlistView(),
    const SettingsView(),
  ];
}