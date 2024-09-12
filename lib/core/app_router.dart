import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:t_store/featrues/log_in/presentation/views/log_in_view.dart';
import 'package:t_store/featrues/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:t_store/featrues/password_configuration/presentation/views/forget_password_view.dart';
import 'package:t_store/featrues/password_configuration/presentation/views/reset_password_view.dart';
import 'package:t_store/featrues/shop/home/presentation/views/home_view.dart';
import 'package:t_store/featrues/shop/navigation_menu/presentation/views/navigation_menu_view.dart';
import 'package:t_store/featrues/shop/navigation_menu/presentation/views_model/navigation_cubit.dart';
import 'package:t_store/featrues/sign_up/presentation/views/sign_up_view.dart';
import 'package:t_store/featrues/verify_email/presentation/views/success_verification_view.dart';
import 'package:t_store/featrues/verify_email/presentation/views/verify_email_view.dart';

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
  // static const kSuccessScreen = "/SuccessScreen";
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
      ]
  );
}

/*
*    GoRoute(
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
* */