import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/auth/log_in/presentation/views/log_in_view.dart';
import 'package:t_store/features/on_boarding/presentation/views/on_boarding_view.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Variable
  final deviceStorage =GetStorage();

  // Called From main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async{
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read("isFirstTime") !=true ? Get.offAll(()=> const LogInView()) : Get.offAll(() => const OnBoardingView());
  }
}