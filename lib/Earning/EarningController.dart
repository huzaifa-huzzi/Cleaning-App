import 'package:cleaning_app/Resources/Colors.dart' show AppColors;
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:cleaning_app/Resources/Colors.dart' show AppColors;
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class EarningController extends GetxController {
  // Selected date for filtering earnings via calendar icon
  var selectedDate = Rxn<DateTime>();

  // Toggle between showing top 3 transactions or all transactions
  var isShowAll = false.obs;

  // Track whether outstanding dues are paid
  var isDuesPaid = false.obs;

  // Unpaid cash jobs list for EarningUnpaidScreen
  final RxList<Map<String, dynamic>> unpaidCashJobs =
      <Map<String, dynamic>>[
        {
          'title': TextString.unpaidJobKitchenTitle,
          'bookingId': TextString.unpaidJobBookingSubtitle,
          'commission': 9.00,
          'formattedCommission': TextString.unpaidJobCommissionNine,
        },
        {
          'title': TextString.unpaidJobHomeTitle,
          'bookingId': TextString.unpaidJobBookingSubtitle,
          'commission': 9.00,
          'formattedCommission': TextString.unpaidJobCommissionNine,
        },
      ].obs;

  // Dynamic total unpaid commission amount
  double get totalUnpaidAmount {
    if (isDuesPaid.value) return 0.0;
    return unpaidCashJobs.fold<double>(
      0.0,
          (sum, item) => sum + ((item['commission'] as num?)?.toDouble() ?? 0.0),
    );
  }

  // Sample earning & commission items
  // Sample earning & commission items
  late final RxList<Map<String, dynamic>> earningsList = <Map<String, dynamic>>[
    {
      'title': TextString.cashJobEarningsTitle,
      'subtitle': '30 Oct · Booking #BK1024',
      'amount': '+\$81.00',
      'status': 'Received',
      'isCredit': true,
      'date': DateTime(2026, 10, 30),
    },
    {
      'title': TextString.cashJobEarningsTitle,
      'subtitle': '30 Oct · Booking #BK1024',
      'amount': '+\$81.00',
      'status': 'Received',
      'isCredit': true,
      'date': DateTime(2026, 10, 30),
    },
    {
      'title': TextString.commissionPaymentTitle,
      'subtitle': '30 Oct · Booking #BK1024',
      'amount': '-\$9.00',
      'status': 'Paid',
      'isCredit': false,
      'date': DateTime(2026, 10, 30),
    },
    {
      'title': TextString.cashJobEarningsTitle,
      'subtitle': '25 Oct · Booking #BK1019',
      'amount': '+\$95.00',
      'status': 'Received',
      'isCredit': true,
      'date': DateTime(2026, 10, 25),
    },
  ].obs;

  void toggleViewAll() {
    isShowAll.value = !isShowAll.value;
  }

  void payOutstandingDues(BuildContext context) {
    context.push(Routes.earningUnpaidCommission);
    isDuesPaid.value = true;
    Get.snackbar(
      'Success',
      'Outstanding commission dues paid successfully!',
      backgroundColor: AppColors.mainGreenColor,
      colorText: AppColors.whiteColor,
    );
  }

  void clearSelectedDate() {
    selectedDate.value = null;
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
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor,
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            dialogTheme: DialogThemeData(
              backgroundColor: AppColors.containerBackground,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDate.value = picked;
      Get.snackbar(
        'Date Selected',
        'Filtered for ${picked.day}/${picked.month}/${picked.year}',
        backgroundColor: AppColors.primaryColor,
        colorText: AppColors.whiteColor,
      );
    }
  }

  // Selected payment method for commission dues (0: Debit / Credit Card, 1: Bank Transfer)
  var selectedCommissionPaymentMethod = 0.obs;

  void selectCommissionPaymentMethod(int index) {
    selectedCommissionPaymentMethod.value = index;
  }

  void continueWithPaymentMethod() {
    final String methodName = selectedCommissionPaymentMethod.value == 0
        ? TextString.debitCreditCardTitle
        : TextString.bankTransferTitle;

    Get.snackbar(
      'Payment Method Selected',
      'Selected: $methodName',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.whiteColor,
    );
  }
}