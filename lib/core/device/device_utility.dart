import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class TDeviceUtils{
  static void hideKeyboard(BuildContext context)
  {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
  SystemChrome.setSystemUIOverlayStyle(
  SystemUiOverlayStyle(statusBarColor: color),
  );
}

  static bool isLandscapeOrientation (BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 8;
  }

  static bool isPortraitOrientation (BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  static double getScreenHeight(BuildContext context){
    return MediaQuery.sizeOf(context).height;
  }
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }

  static void launchUrl (String url) async
  {
    if(await canLaunchUrlString(url))
      {
        await launchUrlString(url);
      }
    else{
      throw "Could not launch $url";
    }
  }
}