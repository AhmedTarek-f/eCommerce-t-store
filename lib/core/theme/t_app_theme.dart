import 'package:flutter/material.dart';
import 'package:t_store/core/constants/colors.dart';
import 'package:t_store/core/theme/custom_theme/t_app_bar_theme.dart';
import 'package:t_store/core/theme/custom_theme/t_app_bottom_sheet_theme.dart';
import 'package:t_store/core/theme/custom_theme/t_check_box_theme.dart';
import 'package:t_store/core/theme/custom_theme/t_chip_theme.dart';
import 'package:t_store/core/theme/custom_theme/t_elevated_button_theme.dart';
import 'package:t_store/core/theme/custom_theme/t_outlined_button_theme.dart';
import 'package:t_store/core/theme/custom_theme/t_text_form_field_theme.dart';
import 'package:t_store/core/theme/custom_theme/t_text_theme.dart';

abstract class TAppTheme
{
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.light,
    primaryColor: TColors.primaryColor,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: TAppBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: "Poppins",
    brightness: Brightness.dark,
    primaryColor: TColors.primaryColor,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBoxTheme,
    bottomSheetTheme: TAppBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme
  );
}