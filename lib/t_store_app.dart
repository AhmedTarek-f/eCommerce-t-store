import 'package:flutter/material.dart';
import 'package:t_store/core/app_router.dart';
import 'package:t_store/core/theme/t_app_theme.dart';

class TStoreApp extends StatelessWidget {
  const TStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}