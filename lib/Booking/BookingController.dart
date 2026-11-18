
import 'package:cleaning_app/Booking/ReusableWidget/BookingButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/ImageString.dart' show ImageString;
import 'package:cleaning_app/Resources/Routes.dart' show Routes;
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BookingController extends GetxController {
  var selectedTab = 0.obs;

  final TextEditingController searchController = TextEditingController();

  var selectedDate = Rxn<DateTime>();
  var selectedRating = 0.obs;
  var selectedPaymentMethod = 0.obs;
  var isCashConfirmed = false.obs;

  void changeTab(int index) {
    selectedTab.value = index;
  }
  void setRating(int rating) {
    selectedRating.value = rating;
  }

  void toggleCashConfirmation(bool? value) {
    isCashConfirmed.value = value ?? false;
  }
  void setPaymentMethod(int index) {
    selectedPaymentMethod.value = index;
  }
  void submitRating() {
    Get.snackbar(
      'Success',
      'Rating submitted successfully: ${selectedRating.value} stars',
      backgroundColor: AppColors.mainGreenColor,
      colorText: AppColors.whiteColor,
    );
  }

  void markReadyForPayment(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    showAcceptJobDialog(context, isTablet: isTablet);
    
  }

  void markReadyForPayment2(BuildContext context) {
    context.push(Routes.bookingPaymentConfirmation);
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
  
  /// Dialogs
  void showAcceptJobDialog(BuildContext context, {required bool isTablet}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final textTheme = Theme.of(context).textTheme;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColors.containerBackground,
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 28 : 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: isTablet ? 70 : 60,
                  height: isTablet ? 70 : 60,
                  child: Image.asset(
                    ImageString.paymentReceivedImage,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Payment Received",
                  style: textTheme.headlineLarge?.copyWith(
                    fontSize: isTablet ? 22 : 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  "Are you sure you want to marked as payment recieved?",
                  style: textTheme.titleSmall?.copyWith(
                    fontSize: isTablet ? 14 : 12,
                    color: AppColors.secondaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: BookingButton(
                        text: "Save",
                        onPressed: () {
                          Navigator.pop(context);
                          showJobAcceptedSuccessDialog(context, isTablet: isTablet);
                        },
                        isTablet: isTablet,
                        backgroundColor: AppColors.primaryColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: BookingButton(
                        text: "Cancel",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        isTablet: isTablet,
                        backgroundColor: AppColors.redColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void showJobAcceptedSuccessDialog(
      BuildContext context, {
        required bool isTablet,
      }) {
    final router = GoRouter.of(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        final textTheme = dialogContext.textTheme;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColors.containerBackground,
          child: Padding(
            padding: EdgeInsets.all(isTablet ? 28 : 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: isTablet ? 80 : 70,
                  height: isTablet ? 80 : 70,
                  child: Image.asset(
                    ImageString.bookingDone,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Payment Marked as Received Successfully",
                  style: dialogContext.textTheme.headlineLarge?.copyWith(
                    fontSize: isTablet ? 22 : 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(
                  "Congratulation!Payment has marked as received successfully in the system",
                  style: dialogContext.textTheme.titleSmall?.copyWith(
                    fontSize: isTablet ? 14 : 12,
                    color: AppColors.secondaryColor,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                BookingButton(
                  text: "Back to Booking",
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    router.go(Routes.bookingScreen);
                  },
                  isTablet: isTablet,
                  backgroundColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}