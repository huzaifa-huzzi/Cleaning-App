
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentIndex = 0.obs;

  void updatePageIndicator(int index) {
    currentIndex.value = index;
  }

  void handleNextButton() {
    if (currentIndex.value < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      // Last page par "Get Started" click hone par agali screen par navigate karein
      // Get.offAll(() => LoginScreen());
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}