import 'package:cleaning_app/Resources/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class DashboardController extends GetxController {
  var unreadNotificationsCount = 3.obs;

  void updateNotificationCount(int count) {
    unreadNotificationsCount.value = count;
  }

  void changeTab(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(Routes.homeScreen);
        break;
      case 1:
        context.go('/bookings');
        break;
      case 2:
        context.go('/earnings');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }
}