import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LanguageController extends GetxController
{
  static LanguageController get instance => Get.find();
  final GetStorage _storage = GetStorage();
  RxString language = "en".obs;

   void selectLanguage(String lang)
   {
     language.value = lang;
     Locale localeLang = Locale(lang);
     _storage.write("lang", lang);
     Get.updateLocale(localeLang);
   }
}