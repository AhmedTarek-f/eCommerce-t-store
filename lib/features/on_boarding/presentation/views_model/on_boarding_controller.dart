import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/features/auth/log_in/presentation/views/log_in_view.dart';

class OnBoardingController extends GetxController
{
  static OnBoardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index)
  {
    currentPageIndex.value = index;
  }

  void dotNavigationClicked(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  void nextPage()
  {
    if(currentPageIndex.value == 2)
    {
      final storage = GetStorage();
      storage.write("isFirstTime", false);
      Get.offAll(()=>const LogInView());
    }
    else
    {
      int page = currentPageIndex.value+1;
      pageController.jumpToPage(page);
    }
  }

  void skipPage()
  {
    if(currentPageIndex.value !=2)
    {
      currentPageIndex.value = 2;
      pageController.jumpToPage(2);
    }
  }
}