import 'package:flutter/material.dart';
import 'package:t_store/core/constants/colors.dart';

abstract class TElevatedButtonTheme
{
  static final ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: TColors.primaryColor,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        side:const BorderSide(color: TColors.primaryColor),
        padding:const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
  );
  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: TColors.primaryColor,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      side:const BorderSide(color: TColors.primaryColor),
      padding:const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16,color: Colors.white,fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );
}