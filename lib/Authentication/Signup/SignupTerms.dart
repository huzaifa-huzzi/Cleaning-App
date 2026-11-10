import 'package:cleaning_app/Authentication/AuthenticationController.dart' show AuthenticationController;
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class SignupTerms extends StatefulWidget {
  const SignupTerms({super.key});

  @override
  State<SignupTerms> createState() => _SignupTermsState();
}

class _SignupTermsState extends State<SignupTerms> {
  final AuthenticationController controller = Get.find<AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width >= 600;

    return Scaffold(
      backgroundColor: AppColors.backgroundOfScreenColor,
      body: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isTablet ? 500 : double.infinity,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: isTablet ? 260 : 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.fieldColors,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      ImageString.loginPic,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.error, color: Colors.red),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? 32.0 : 24.0,
                    vertical: 24.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: AppColors.fieldColors,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor, size: 20),
                              onPressed: () {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);

                                }
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.fieldColors,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              '09 / 10',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'One Last Step',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: isTablet ? 28 : 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Please review and acknowledge the policies that apply to your work on the platform.',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 13,
                          color: AppColors.secondaryColor,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildPolicyCard(
                        context: context,
                        title: 'Cleaner Terms of Service',
                        subtitle: 'Platform rules, responsibilities and account conditions.',
                        svgIconPath: IconString.clearerTerms,
                        policyContent: 'Here are the complete Cleaner Terms of Service guidelines and platform rules detailing your responsibilities and account conditions...',
                      ),
                      const SizedBox(height: 12),
                      _buildPolicyCard(
                        context: context,
                        title: 'Commission & Payment Policy',
                        subtitle: '10% commission, cash reporting, payment records and settlement process.',
                        svgIconPath: IconString.commissionTerms,
                        policyContent: 'Details regarding the 10% commission fee, cash reporting guidelines, payment records, and the weekly settlement process...',
                      ),
                      const SizedBox(height: 12),
                      _buildPolicyCard(
                        context: context,
                        title: 'Privacy Policy',
                        subtitle: 'How personal information is collected, used, stored and disclosed.',
                        svgIconPath: IconString.privacyPolicy,
                        policyContent: 'Our Privacy Policy explains how your personal data and information are collected, used, securely stored, and disclosed...',
                      ),
                      const SizedBox(height: 24),
                      _buildCheckboxOption(
                        context: context,
                        title: 'I have read and agree to the Cleaner Terms of Service.',
                        rxBoolValue: controller.agreeToTerms,
                      ),
                      const SizedBox(height: 12),
                      _buildCheckboxOption(
                        context: context,
                        title: 'I acknowledge the 10% commission and payment policy.',
                        rxBoolValue: controller.agreeToCommission,
                      ),
                      const SizedBox(height: 12),
                      _buildCheckboxOption(
                        context: context,
                        title: 'I acknowledge the Privacy Policy.',
                        rxBoolValue: controller.agreeToPrivacy,
                      ),

                      const SizedBox(height: 32),
                      Obx(() => SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.isAllPoliciesAccepted.value
                              ? () {

                          }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            disabledBackgroundColor: Colors.grey.shade300,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Submit',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: controller.isAllPoliciesAccepted.value
                                  ? AppColors.whiteColor
                                  : AppColors.secondaryColor,
                            ),
                          ),
                        ),
                      )),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ------------- Extra Widgets ----------------- ///

   // Policy Cards
  Widget _buildPolicyCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String svgIconPath,
    required String policyContent,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            svgIconPath,
            width: 22,
            height: 22,
            colorFilter: const ColorFilter.mode(
              AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 11,
                    color: AppColors.secondaryColor,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              icon: const Icon(Icons.remove_red_eye_outlined, color: AppColors.whiteColor, size: 18),
              constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
              padding: EdgeInsets.zero,
              onPressed: () {
                _showPolicyBottomSheet(context, title, policyContent);
              },
            ),
          ),
        ],
      ),
    );
  }

   // Checkbox Options
  Widget _buildCheckboxOption({
    required BuildContext context,
    required String title,
    required RxBool rxBoolValue,
  }) {
    return Obx(() => GestureDetector(
      onTap: () => rxBoolValue.value = !rxBoolValue.value,
      child: Row(
        children: [
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              value: rxBoolValue.value,
              onChanged: (val) => rxBoolValue.value = val ?? false,
              activeColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: AppColors.blackColor,
              ),
            ),
          ),
        ],
      ),
    ));
  }

   // Policy BottomSheet
  void _showPolicyBottomSheet(BuildContext context, String title, String content) {
    bool isTablet = MediaQuery.of(context).size.width >= 600;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isTablet ? 550 : double.infinity,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: AppColors.secondaryColor),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const Divider(height: 24),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        content,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 13,
                          color: AppColors.secondaryColor,
                          height: 1.6,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'I Understand',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
