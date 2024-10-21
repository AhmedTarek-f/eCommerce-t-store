import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/core/bindings/general_bindings.dart';
import 'package:t_store/core/lang/languages.dart';
import 'package:t_store/core/routes/app_routers.dart';
import 'package:t_store/core/theme/t_app_theme.dart';
import 'package:t_store/features/on_boarding/presentation/views/language_view.dart';

import 'data/repositories/authentication/authentication_repository.dart';

class TStoreApp extends StatelessWidget {
  const TStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthenticationRepository controller = AuthenticationRepository.instance;
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: controller.deviceStorage.read("isDarkTheme") == null? ThemeMode.system : controller.initTheme(),
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      locale: controller.deviceStorage.read("lang") == null? Get.deviceLocale : controller.initLanguage() ,
      translations: Languages(),
      initialBinding: GeneralBindings(),
      home: const LanguageView(),
    );
  }
}