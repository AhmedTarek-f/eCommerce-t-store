import 'package:get/get.dart';
import 'package:t_store/core/routes/t_routes.dart';
import 'package:t_store/features/auth/log_in/presentation/views/log_in_view.dart';
import 'package:t_store/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:t_store/features/personalization/my_address/presentation/views/my_address_view.dart';
import 'package:t_store/features/personalization/my_orders/presentation/views/my_orders_view.dart';
import 'package:t_store/features/personalization/profile/presentation/views/profile_view.dart';
import 'package:t_store/features/personalization/settings/presentation/views/settings_view.dart';
import 'package:t_store/features/shop/cart/presentation/views/cart_view.dart';
import 'package:t_store/features/shop/home/presentation/views/home_view.dart';
import 'package:t_store/features/shop/store/presentation/views/store_view.dart';

abstract class AppRouters {
  static final List<GetPage<dynamic>> pages = [
    GetPage(name: TRoutes.home, page: ()=> const HomeView()),
    GetPage(name: TRoutes.signIn, page: ()=> const LogInView()),
    GetPage(name: TRoutes.settings, page: ()=> const SettingsView()),
    GetPage(name: TRoutes.cart, page: ()=> const CartView()),
    GetPage(name: TRoutes.userProfile, page: ()=> const ProfileView()),
    GetPage(name: TRoutes.userAddress, page: ()=> const MyAddressView()),
    GetPage(name: TRoutes.store, page: ()=> const StoreView()),
    GetPage(name: TRoutes.order, page: ()=> const MyOrdersView()),
    GetPage(name: TRoutes.onBoarding, page: ()=> const OnBoardingView()),
  ];
}