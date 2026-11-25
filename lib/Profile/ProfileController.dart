import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfileController extends GetxController {
  var profileImagePath = ImageString.avatarIcon.obs;
  var userName = 'Awais Ali'.obs;
  var userEmail = 'awais@gmail.com'.obs;
  var isVerifiedCleaner = true.obs;
  var fullName = 'Awais Ali'.obs;
  var phoneNumber = '+61 412 345 678'.obs;
  var personalEmail = 'sarah@email.com'.obs;
  var address = 'Parramatta, NSW'.obs;
  var cleaningServices = 'Awais Ali'.obs;
  var experience = '+61 412 345 678'.obs;
  var serviceArea = 'Parramatta, NSW'.obs;

  void onEditProfileTap(BuildContext context) {
    Get.snackbar(
      'Edit Profile',
      'Opening Edit Profile...',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.whiteColor,
    );
  }
}