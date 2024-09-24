import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:t_store/common_widgets/success_screen.dart';
import 'package:t_store/features/auth/log_in/presentation/views/log_in_view.dart';
import 'package:t_store/features/auth/password_configuration/presentation/views/forget_password_view.dart';
import 'package:t_store/features/auth/password_configuration/presentation/views/reset_password_view.dart';
import 'package:t_store/features/auth/sign_up/presentation/views/sign_up_view.dart';
import 'package:t_store/features/auth/verify_email/presentation/views/success_verification_view.dart';
import 'package:t_store/features/auth/verify_email/presentation/views/verify_email_view.dart';
import 'package:t_store/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:t_store/features/personalization/my_address/presentation/views/add_new_address_view.dart';
import 'package:t_store/features/personalization/my_address/presentation/views/my_address_view.dart';
import 'package:t_store/features/personalization/my_orders/presentation/views/my_orders_view.dart';
import 'package:t_store/features/personalization/profile/presentation/views/profile_view.dart';
import 'package:t_store/features/personalization/settings/presentation/views/settings_view.dart';
import 'package:t_store/features/shop/cart/presentation/views/cart_view.dart';
import 'package:t_store/features/shop/checkout/presentation/views/checkout_view.dart';
import 'package:t_store/features/shop/home/presentation/views/home_view.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views/navigation_menu_view.dart';
import 'package:t_store/features/shop/navigation_menu/presentation/views_model/navigation_cubit.dart';
import 'package:t_store/features/shop/product_details/presentation/views/product_details_view.dart';
import 'package:t_store/features/shop/product_review/presentation/views/product_review_view.dart';
import 'package:t_store/features/shop/store/presentation/views/store_view.dart';
import 'package:t_store/features/shop/wishlist/presentation/views/wishlist_view.dart';

abstract class AppRouter
{
  static const kOnBoardingView = "/";
  static const kLogInView = "/LogInView";
  static const kSignUpView = "/SignUpView";
  static const kVerifyEmailView = "/VerifyEmailView";
  static const kSuccessVerificationView = "/SuccessVerificationView";
  static const kForgetPasswordView = "/ForgetPasswordView";
  static const kResetPasswordView = "/ResetPasswordView";
  static const kNavigationMenuView = "/NavigationMenuView";
  static const kHomeView = "/HomeView";
  static const kStoreView = "/StoreView";
  static const kWishlistView = "/WishlistView";
  static const kSettingsView = "/SettingsView";
  static const kProfileView = "/ProfileView";
  static const kProductDetailsView = "/ProductDetailsView";
  static const kProductReviewView = "/ProductReviewView";
  static const kMyAddressView = "/MyAddressView";
  static const kAddNewAddressView = "/AddNewAddressView";
  static const kCartView = "/CartView";
  static const kCheckoutView = "/CheckoutView";
  static const kSuccessScreen = "/SuccessScreen";
  static const kMyOrdersView = "/MyOrdersView";
  static final router = GoRouter(
      routes: [
        GoRoute(
          path: kOnBoardingView,
          builder: (context, state) =>const OnBoardingView(),
        ),
        GoRoute(
          path: kLogInView,
          builder: (context, state) =>const LogInView(),
        ),
        GoRoute(
          path: kSignUpView,
          builder: (context, state) =>const SignUpView(),
        ),
        GoRoute(
          path: kVerifyEmailView,
          builder: (context, state) =>const VerifyEmailView(),
        ),
        GoRoute(
          path: kSuccessVerificationView,
          builder: (context, state) =>const SuccessVerificationView(),
        ),
        GoRoute(
          path: kForgetPasswordView,
          builder: (context, state) =>const ForgetPasswordView(),
        ),
        GoRoute(
          path: kResetPasswordView,
          builder: (context, state) =>const ResetPasswordView(),
        ),
        GoRoute(
          path: kNavigationMenuView,
          builder: (context, state) =>BlocProvider<NavigationCubit>(
              create: (context) => NavigationCubit(),
              child: const NavigationMenuView(),
          ),
        ),
        GoRoute(
          path: kHomeView,
          builder: (context, state) =>const HomeView(),
        ),
        GoRoute(
          path: kStoreView,
          builder: (context, state) =>const StoreView(),
        ),
        GoRoute(
          path: kWishlistView,
          builder: (context, state) =>const WishlistView(),
        ),
        GoRoute(
          path: kSettingsView,
          builder: (context, state) =>const SettingsView(),
        ),
        GoRoute(
          path: kProfileView,
          builder: (context, state) =>const ProfileView(),
        ),
        GoRoute(
          path: kProductDetailsView,
          builder: (context, state) =>const ProductDetailsView(),
        ),
        GoRoute(
          path: kProductReviewView,
          builder: (context, state) =>const ProductReviewView(),
        ),
        GoRoute(
          path: kMyAddressView,
          builder: (context, state) =>const MyAddressView(),
        ),
        GoRoute(
          path: kAddNewAddressView,
          builder: (context, state) =>const AddNewAddressView(),
        ),
        GoRoute(
          path: kCartView,
          builder: (context, state) =>const CartView(),
        ),
        GoRoute(
          path: kCheckoutView,
          builder: (context, state) =>const CheckoutView(),
        ),
        GoRoute(
          path: kSuccessScreen,
          builder: (context, state) {
            // Extract the parameters from the extra object
            final extra = state.extra as Map<String, dynamic>? ?? {};
            final image = extra['image'] ?? 'assets/success.png';
            final title = extra['title'] ?? 'Success!';
            final subTitle = extra['subTitle'] ?? 'Operation completed successfully.';
            final void Function()? onPressed = extra['onPressed'] ?? (){};

            return SuccessScreen(
              image: image,
              title: title,
              subTitle: subTitle,
              onPressed: onPressed,
            );
          },
        ),
        GoRoute(
          path: kMyOrdersView,
          builder: (context, state) =>const MyOrdersView(),
        ),
      ]
  );
}

