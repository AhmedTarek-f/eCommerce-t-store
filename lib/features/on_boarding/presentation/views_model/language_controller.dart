import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController
{
  static LanguageController get instance => Get.find();
  final GetStorage _storage = GetStorage();
  RxString language = "".obs;

  @override
  void onInit() {
    _storage.writeIfNull("lang", "en");
    language.value = _storage.read("lang");
    super.onInit();
  }

  Future<void> selectLanguage(String lang) async
   {
     language.value = lang;
     Locale localeLang = Locale(lang);
     _storage.write("lang", lang);
     await Get.updateLocale(localeLang);
   }
}