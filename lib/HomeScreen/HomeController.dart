

import 'package:get/get.dart';


class HomeController extends GetxController {
  // Online/Offline status
  var isOnline = false.obs;

  // Filter chips ke liye selected index
  var selectedIndex = 0.obs;

  void toggleAvailability() {
    isOnline.value = !isOnline.value;
  }

  // Filter select karne ki function
  void changeFilterIndex(int index) {
    selectedIndex.value = index;
  }
}