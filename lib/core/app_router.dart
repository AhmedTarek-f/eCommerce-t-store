import 'package:go_router/go_router.dart';
import 'package:t_store/featrues/log_in/presentation/views/log_in_view.dart';
import 'package:t_store/featrues/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:t_store/featrues/sign_up/presentation/views/sign_up_view.dart';

abstract class AppRouter
{
  static const kOnBoardingView = "/";
  static const kLogInView = "/LogInView";
  static const kSignUpView = "/SignUpView";
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
      ]
  );
}