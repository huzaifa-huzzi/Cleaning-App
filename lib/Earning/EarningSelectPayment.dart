import 'package:cleaning_app/Earning/EarningController.dart' show EarningController;
import 'package:cleaning_app/Earning/ReusableWidget/EarningButton.dart' show EarningButton;
import 'package:cleaning_app/Resources/Colors.dart' show AppColors;
import 'package:cleaning_app/Resources/IconString.dart' show IconString;
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:cleaning_app/Sidebar/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class EarningSelectPayment extends StatefulWidget {
  const EarningSelectPayment({super.key});

  @override
  State<EarningSelectPayment> createState() => _EarningSelectPaymentState();
}

class _EarningSelectPaymentState extends State<EarningSelectPayment> {
  final EarningController controller = Get.isRegistered<EarningController>()
      ? Get.find<EarningController>()
      : Get.put(EarningController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth >= 600;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      endDrawer: const Sidebar(),
      backgroundColor: AppColors.backgroundOfScreenColor,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isTablet ? 820 : double.infinity,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Top Header Banner
                Container(
                  width: double.infinity,
                  height: isTablet ? 220 : 160,
                  padding: EdgeInsets.only(
                    top: isTablet ? 60 : 50,
                    left: isTablet ? 32 : 20,
                    right: isTablet ? 32 : 20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    image: DecorationImage(
                      image: AssetImage(ImageString.homebackgroundScreen),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.whiteColor,
                                  size: isTablet ? 28 : 24,
                                ),
                                onPressed: () => Navigator.pop(context),
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    TextString.selectPaymentMethodTitle,
                                    style: textTheme.headlineLarge?.copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: isTablet ? 22 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    TextString.selectPaymentMethodSubtitle,
                                    style: textTheme.titleSmall?.copyWith(
                                      color: AppColors.whiteColor.withValues(alpha: 0.8),
                                      fontSize: isTablet ? 14 : 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Stack(
                                children: [
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      IconString.notification,
                                      width: isTablet ? 28 : 24,
                                      height: isTablet ? 28 : 24,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.whiteColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                  Positioned(
                                    right: 11,
                                    top: 11,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: const BoxDecoration(
                                        color: AppColors.redColor,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Builder(
                                builder: (BuildContext innerContext) {
                                  return IconButton(
                                    icon: SvgPicture.asset(
                                      IconString.menuIcon,
                                      width: isTablet ? 28 : 24,
                                      height: isTablet ? 28 : 24,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.whiteColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    onPressed: () {
                                      Scaffold.of(innerContext).openEndDrawer();
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // 2. Outstanding Commission Summary Card with Wallet Icon
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(isTablet ? 24 : 18),
                    decoration: BoxDecoration(
                      color: AppColors.containerBackground,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withValues(alpha: 0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              TextString.outstandingCommissionLabel,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 13 : 11,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              TextString.outstandingCommissionValue,
                              style: textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 24 : 20,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          ImageString.paymentReceivedImage,
                          width: isTablet ?  45: 50,
                          height: isTablet ? 45 : 50,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 3. Available Methods Heading
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Text(
                    TextString.availableMethodsHeading,
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: isTablet ? 20 : 16,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),

                const SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Obx(() => Column(
                    children: [
                      _buildMethodSelectionCard(
                        context: context,
                        textTheme: textTheme,
                        index: 0,
                        title: TextString.debitCreditCardTitle,
                        subtitle: TextString.debitCreditCardSubtitle,
                        svgPath: IconString.debitCardIcon,
                        isTablet: isTablet,
                      ),
                      const SizedBox(height: 12),
                      _buildMethodSelectionCard(
                        context: context,
                        textTheme: textTheme,
                        index: 1,
                        title: TextString.bankTransferTitle,
                        subtitle: TextString.bankTransferSubtitle,
                        svgPath: IconString.debitCardIcon,
                        isTablet: isTablet,
                      ),
                    ],
                  )),
                ),

                const SizedBox(height: 24),

                // 5. Continue Action Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Center(
                    child: EarningButton(
                      text: TextString.continuePaymentButton,
                      isTablet: isTablet,
                      backgroundColor: AppColors.primaryColor,
                      onPressed: () => controller.continueWithPaymentMethod(),
                    ),
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ----------------- Extra Widget ------------------ ///

   // Method Selection Card
  Widget _buildMethodSelectionCard({
    required BuildContext context,
    required TextTheme textTheme,
    required int index,
    required String title,
    required String subtitle,
    required String svgPath,
    required bool isTablet,
  }) {
    final bool isSelected = controller.selectedCommissionPaymentMethod.value == index;

    return GestureDetector(
      onTap: () => controller.selectCommissionPaymentMethod(index),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 20 : 16,
          vertical: isTablet ? 18 : 14,
        ),
        decoration: BoxDecoration(
          color: AppColors.containerBackground,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              width: isTablet ? 24 : 20,
              height: isTablet ? 24 : 20,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: isTablet ? 16 : 14,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: textTheme.titleSmall?.copyWith(
                      fontSize: isTablet ? 13 : 11,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: isTablet ? 24 : 20,
              height: isTablet ? 24 : 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primaryColor : AppColors.photoBackground,
                  width: 2,
                ),
                color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
              ),
              child: isSelected
                  ? Icon(
                Icons.check,
                size: isTablet ? 14 : 12,
                color: AppColors.whiteColor,
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}