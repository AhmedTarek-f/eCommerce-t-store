import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/bindings/general_bindings.dart';
import 'package:t_store/core/lang/languages.dart';
import 'package:t_store/core/routes/app_routers.dart';
import 'package:t_store/core/theme/t_app_theme.dart';
import 'package:t_store/features/on_boarding/presentation/views/language_view.dart';
import 'package:t_store/features/on_boarding/presentation/views/on_boarding_view.dart';

class TStoreApp extends StatelessWidget {
  const TStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      getPages: AppRouters.pages,
      locale: Get.deviceLocale,
      translations: Languages(),
      initialBinding: GeneralBindings(),
      home: const LanguageView(),
    );
  }
}