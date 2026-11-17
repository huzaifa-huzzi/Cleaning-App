
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  // Active tab index for Bookings filter (0: Booked, 1: Completed, 2: Cancelled)
  var selectedTab = 0.obs;

  // Search controller for filtering bookings in Completed tab
  final TextEditingController searchController = TextEditingController();

  // Selected date for filter
  var selectedDate = Rxn<DateTime>();

  // --- New Variables for Booking Showing / Details Screen ---
  var selectedRating = 0.obs; // Star rating state

  void changeTab(int index) {
    selectedTab.value = index;
  }

  // Update rating when user taps on stars
  void setRating(int rating) {
    selectedRating.value = rating;
  }

  // Submit rating action
  void submitRating() {
    // Yahan aap API call ya backend logic likh sakte hain
    Get.snackbar(
      'Success',
      'Rating submitted successfully: ${selectedRating.value} stars',
      backgroundColor: AppColors.mainGreenColor,
      colorText: AppColors.whiteColor,
    );
  }

  // Mark ready for payment action
  void markReadyForPayment() {
    Get.snackbar(
      'Status Updated',
      'Booking marked ready for payment.',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.whiteColor,
    );
  }

  // Function to open Date Picker dialog
  Future<void> pickDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
      helpText: TextString.selectDateTitle,
      cancelText: TextString.dialogCancel,
      confirmText: TextString.dialogOk,
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primaryColor,
              onPrimary: AppColors.whiteColor,
              surface: AppColors.containerBackground,
              onSurface: AppColors.blackColor,
            ),
            dialogBackgroundColor: AppColors.containerBackground,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}