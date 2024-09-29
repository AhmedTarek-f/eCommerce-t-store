import 'package:get/get.dart';

class HomeController extends GetxController
{
  static HomeController get instance => Get.find();
  int currentImageIndex =0;
  void updateImageIndex(int index)
  {
    currentImageIndex = index;
    update();
  }
}