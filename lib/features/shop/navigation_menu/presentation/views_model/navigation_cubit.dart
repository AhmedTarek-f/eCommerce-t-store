import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t_store/features/personalization/settings/presentation/views/settings_view.dart';
import 'package:t_store/features/shop/home/presentation/views/home_view.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views_model/navigation_states.dart';
import 'package:t_store/features/shop/store/presentation/views/store_view.dart';
import 'package:t_store/features/shop/wishlist/presentation/views/wishlist_view.dart';

class NavigationCubit extends Cubit<NavigationStates>
{
  NavigationCubit():super(NavigationInitialState());
  int selectedIndex =0;
  void changeSelectedIndex(int value)
  {
    selectedIndex = value;
    emit(NavigationChangeIndexState());
  }
  final List<Widget> screens = [
    const HomeView(),
    const StoreView(),
    const WishlistView(),
    const SettingsView(),
  ];
}