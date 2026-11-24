import 'package:cleaning_app/Earning/EarningController.dart' show EarningController;
import 'package:cleaning_app/Earning/ReusableWidget/EarningButton.dart';
import 'package:cleaning_app/Resources/Colors.dart' show AppColors;
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:cleaning_app/Sidebar/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class EarningEnterPaymentScreen extends StatefulWidget {
  const EarningEnterPaymentScreen({super.key});

  @override
  State<EarningEnterPaymentScreen> createState() => _EarningEnterPaymentScreenState();
}

class _EarningEnterPaymentScreenState extends State<EarningEnterPaymentScreen> {
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

                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TextString.availableMethodsHeading,
                        style: textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 20 : 16,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        TextString.enterCardDetailsSubtitle,
                        style: textTheme.titleSmall?.copyWith(
                          fontSize: isTablet ? 13 : 11,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFieldLabel(
                        textTheme: textTheme,
                        label: TextString.cardholderNameLabel,
                        isTablet: isTablet,
                      ),
                      const SizedBox(height: 8),
                      _buildInputContainer(
                        isTablet: isTablet,
                        child: TextField(
                          cursorColor: AppColors.blackColor,
                          controller: controller.cardholderController,
                          keyboardType: TextInputType.name,
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: isTablet ? 15 : 13,
                            color: AppColors.blackColor,
                          ),
                          decoration: _inputDecoration(
                            textTheme: textTheme,
                            hintText: TextString.cardholderNameHint,
                            isTablet: isTablet,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Card Number
                      _buildFieldLabel(
                        textTheme: textTheme,
                        label: TextString.cardNumberLabel,
                        isTablet: isTablet,
                      ),
                      const SizedBox(height: 8),
                      _buildInputContainer(
                        isTablet: isTablet,
                        child: TextField(
                          cursorColor: AppColors.blackColor,
                          controller: controller.cardNumberController,
                          keyboardType: TextInputType.number,
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: isTablet ? 15 : 13,
                            color: AppColors.blackColor,
                          ),
                          decoration: _inputDecoration(
                            textTheme: textTheme,
                            hintText: TextString.cardNumberHint,
                            isTablet: isTablet,
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Expiry Date & CVV Row
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildFieldLabel(
                                  textTheme: textTheme,
                                  label: TextString.expiryDateLabel,
                                  isTablet: isTablet,
                                ),
                                const SizedBox(height: 8),
                                _buildInputContainer(
                                  isTablet: isTablet,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          cursorColor: AppColors.blackColor,
                                          controller: controller.expiryDateController,
                                          readOnly: true,
                                          onTap: () => controller.pickExpiryDate(context),
                                          style: textTheme.bodyMedium?.copyWith(
                                            fontSize: isTablet ? 15 : 13,
                                            color: AppColors.blackColor,
                                          ),
                                          decoration: _inputDecoration(
                                            textTheme: textTheme,
                                            hintText: TextString.expiryDateHint,
                                            isTablet: isTablet,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      InkWell(
                                        onTap: () => controller.pickExpiryDate(context),
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          padding: EdgeInsets.all(isTablet ? 8 : 6),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: SvgPicture.asset(
                                            IconString.bookingScreenIcon,
                                            width: isTablet ? 18 : 15,
                                            height: isTablet ? 18 : 15,
                                            colorFilter: const ColorFilter.mode(
                                              AppColors.whiteColor,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildFieldLabel(
                                  textTheme: textTheme,
                                  label: TextString.cvvLabel,
                                  isTablet: isTablet,
                                ),
                                const SizedBox(height: 8),
                                _buildInputContainer(
                                  isTablet: isTablet,
                                  child: TextField(
                                    cursorColor: AppColors.blackColor,
                                    controller: controller.cvvController,
                                    keyboardType: TextInputType.number,
                                    obscureText: true,
                                    style: textTheme.bodyMedium?.copyWith(
                                      fontSize: isTablet ? 15 : 13,
                                      color: AppColors.blackColor,
                                    ),
                                    decoration: _inputDecoration(
                                      textTheme: textTheme,
                                      hintText: TextString.cvvHint,
                                      isTablet: isTablet,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Center(
                    child: EarningButton(
                      text: TextString.payAmountButtonPrefix,
                      isTablet: isTablet,
                      backgroundColor: AppColors.primaryColor,
                      onPressed: () => controller.submitCommissionPayment(
                        context,
                        isTablet: isTablet,
                      ),
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

   // Field label
  Widget _buildFieldLabel({
    required TextTheme textTheme,
    required String label,
    required bool isTablet,
  }) {
    return Text(
      label,
      style: textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: isTablet ? 15 : 13,
        color: AppColors.blackColor,
      ),
    );
  }

   // Input Decoration
  Widget _buildInputContainer({
    required Widget child,
    required bool isTablet,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 16 : 14,
        vertical: isTablet ? 6 : 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.containerBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }

  InputDecoration _inputDecoration({
    required TextTheme textTheme,
    required String hintText,
    required bool isTablet,
  }) {
    return InputDecoration(
      border: InputBorder.none,
      isDense: true,
      contentPadding: EdgeInsets.symmetric(vertical: isTablet ? 12 : 10),
      hintText: hintText,
      hintStyle: textTheme.titleSmall?.copyWith(
        fontSize: isTablet ? 14 : 12,
        color: AppColors.secondaryColor,
      ),
    );
  }
}