import 'package:cleaning_app/Earning/ReusableWidget/EarningButton.dart';
import 'package:cleaning_app/Resources/Colors.dart' show AppColors;
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class EarningController extends GetxController {
  var selectedDate = Rxn<DateTime>();
  var isShowAll = false.obs;
  var isDuesPaid = false.obs;

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

  double get totalUnpaidAmount {
    if (isDuesPaid.value) return 0.0;
    return unpaidCashJobs.fold<double>(
      0.0,
          (sum, item) => sum + ((item['commission'] as num?)?.toDouble() ?? 0.0),
    );
  }

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

  void toggleViewAll(BuildContext context) {
    context.push(Routes.earningViewAll);
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

  var selectedCommissionPaymentMethod = 0.obs;

  void selectCommissionPaymentMethod(int index) {
    selectedCommissionPaymentMethod.value = index;
  }

  final TextEditingController cardholderController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  Future<void> pickExpiryDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(now.year, now.month),
      lastDate: DateTime(now.year + 20, 12, 31),
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
      final String formattedMonth = picked.month.toString().padLeft(2, '0');
      final String formattedYear = (picked.year % 100).toString().padLeft(2, '0');
      expiryDateController.text = '$formattedMonth/$formattedYear';
    }
  }
  void showPaymentSuccessDialog(
      BuildContext context, {
        required bool isTablet,
      }) {
    final router = GoRouter.of(context);
    final String paymentMethodText = selectedCommissionPaymentMethod.value == 1
        ? TextString.paymentMethodBankValue
        : TextString.paymentMethodCardValue;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        final textTheme = Theme.of(dialogContext).textTheme;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColors.containerBackground,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isTablet ? 460 : double.infinity,
            ),
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
                  const SizedBox(height: 18),
                  Text(
                    TextString.paymentSuccessfulTitle,
                    style: textTheme.headlineLarge?.copyWith(
                      fontSize: isTablet ? 22 : 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    TextString.paymentSuccessfulSubtitle,
                    style: textTheme.titleSmall?.copyWith(
                      fontSize: isTablet ? 14 : 12,
                      color: AppColors.secondaryColor,
                      height: 1.35,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 18),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 18 : 14,
                      vertical: isTablet ? 16 : 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withValues(alpha: 0.03),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.paymentMethodSummaryLabel,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 13 : 11,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            Text(
                              paymentMethodText,
                              style: textTheme.bodyMedium?.copyWith(
                                fontSize: isTablet ? 14 : 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.outstandingBalanceSummaryLabel,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 13 : 11,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            Text(
                              TextString.zeroBalanceValue,
                              style: textTheme.bodyMedium?.copyWith(
                                fontSize: isTablet ? 14 : 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.paymentStatusSummaryLabel,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 13 : 11,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            Text(
                              TextString.paymentStatusVerifiedValue,
                              style: textTheme.bodyMedium?.copyWith(
                                fontSize: isTablet ? 14 : 12,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainGreenColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  EarningButton(
                    text: TextString.backToEarningButton,
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      router.go(Routes.earningScreen);
                    },
                    isTablet: isTablet,
                    backgroundColor: AppColors.primaryColor,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void submitCommissionPayment(
      BuildContext context, {
        required bool isTablet,
      }) {

    isDuesPaid.value = true;
    showPaymentSuccessDialog(context, isTablet: isTablet);
  }

  List<Map<String, dynamic>> get filteredEarningsList {
    final DateTime? targetDate = selectedDate.value;

    if (targetDate == null) {
      return earningsList.toList();
    }

    return earningsList.where((item) {
      final DateTime? itemDate = item['date'] as DateTime?;

      if (itemDate == null) return false;

      return itemDate.year == targetDate.year &&
          itemDate.month == targetDate.month &&
          itemDate.day == targetDate.day;
    }).toList();
  }

  @override
  void onClose() {
    cardholderController.dispose();
    cardNumberController.dispose();
    expiryDateController.dispose();
    cvvController.dispose();
    super.onClose();
  }

  void continueWithPaymentMethod(BuildContext context) {
     context.push(Routes.earningEnterPayment);
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