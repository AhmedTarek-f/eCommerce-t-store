import 'package:go_router/go_router.dart';
import 'package:t_store/featrues/on_boarding/presentation/views/on_boarding_view.dart';

abstract class AppRouter
{
  static const kOnBoardingView = "/";
  static final router = GoRouter(
      routes: [
        GoRoute(
          path: kOnBoardingView,
          builder: (context, state) =>const OnBoardingView(),
        ),
      ]
  );
}