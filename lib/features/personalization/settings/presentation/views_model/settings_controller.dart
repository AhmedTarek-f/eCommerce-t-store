import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/core/theme/t_app_theme.dart';

class SettingsController extends GetxController
{
  static SettingsController get instance => Get.find();
  final GetStorage _storage = GetStorage();
  final RxBool isEnglish = true.obs;
  final RxBool isDarkMode = false.obs;
  @override
  void onInit() {
    languageInit();
    super.onInit();
  }

  Future<void> languageInit() async {
    if(_storage.read("lang") == "" ||_storage.read("lang") == null ){
      _storage.writeIfNull("lang", "en");
      Locale language = const Locale("en");
      await Get.updateLocale(language);
    }
  }

  bool isEnglishLang() {
    final String lang = _storage.read("lang");
    if(lang.isNotEmpty) {
      lang == "en" ? isEnglish.value = true : isEnglish.value = false;
      return isEnglish.value;
    }
    else {
      isEnglish.value = true;
      return isEnglish.value;
    }
  }

  bool isDarkTheme() {
    _storage.writeIfNull("isDarkTheme", false);
    final bool isDark = _storage.read("isDarkTheme");
    if(isDark) {
      isDarkMode.value = isDark;
      return isDarkMode.value;
    }
    else {
      isDarkMode.value = isDark;
      return isDarkMode.value;
    }
  }

  Future<void> changeLanguage() async{
    final String lang = _storage.read("lang");
    final Locale language;

    if(lang.isNotEmpty && lang =="en" && isEnglish.value)
      {
        isEnglish.value = !isEnglish.value;
        _storage.write("lang","ar");
        language= const Locale("ar");
        await Get.updateLocale(language);
      }
    else if(lang.isNotEmpty && lang =="ar" && !isEnglish.value)
      {
        isEnglish.value = !isEnglish.value;
        _storage.write("lang","en");
        language= const Locale("en");
        await Get.updateLocale(language);
      }
  }

  void changeThemeMode() {
    if(Get.isDarkMode && isDarkMode.value)
      {
        isDarkMode.value = false;
        _storage.write("isDarkTheme", false);
        Get.changeTheme(TAppTheme.lightTheme);
      }
    else if(!Get.isDarkMode && !isDarkMode.value){
      _storage.write("isDarkTheme", true);
      isDarkMode.value = true;
      Get.changeTheme(TAppTheme.darkTheme);
    }
  }

}