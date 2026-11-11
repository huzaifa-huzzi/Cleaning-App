import 'package:cleaning_app/Authentication/AuthenticationController.dart';
import 'package:cleaning_app/Authentication/ReusableWidget/AuthButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SignupCleaning extends StatefulWidget {
  const SignupCleaning({super.key});

  @override
  State<SignupCleaning> createState() => _SignupCleaningState();
}

class _SignupCleaningState extends State<SignupCleaning> {
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
                                } else {
                                  context.go(Routes.signupConfirmIdentity);
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
                              TextString.stepIndicator,
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
                        TextString.setupCleaningTitle,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: isTablet ? 28 : 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        TextString.setupCleaningSubtitle,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 13,
                          color: AppColors.secondaryColor,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 24),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.fieldColors.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Column(
                                children: [
                                  Image.asset(ImageString.cleaningService, width: 60, height: 60),
                                  const SizedBox(height: 10),
                                  Text(
                                    TextString.cleaningServicesHeader,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    TextString.selectAllApply,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      color: Colors.grey.shade500,
                                      fontSize: 11,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),

                            _buildMultiSelectOption(TextString.serviceRegular),
                            const SizedBox(height: 10),
                            _buildMultiSelectOption(TextString.serviceDeep),
                            const SizedBox(height: 10),
                            _buildMultiSelectOption(TextString.serviceEndLease),
                            const SizedBox(height: 10),
                            _buildMultiSelectOption(TextString.serviceBathroomKitchen),
                            const SizedBox(height: 10),
                            _buildMultiSelectOption(TextString.serviceWindow),

                            const SizedBox(height: 24),

                            Text(
                              TextString.cleaningExperienceLabel,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: AppColors.blackColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildTextField(TextString.experienceHint, IconString.experience, controller.cleaningExperienceController),

                            const SizedBox(height: 16),
                            Text(
                              TextString.serviceAreaLabel,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: AppColors.blackColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildTextField(TextString.serviceAreaHint, IconString.serviceArea, controller.serviceAreaController),

                            const SizedBox(height: 20),

                            Text(
                              TextString.availabilityLabel,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: AppColors.blackColor,
                              ),
                            ),
                            const SizedBox(height: 12),
                            _buildAvailabilityOption(TextString.availWeekdays),
                            const SizedBox(height: 10),
                            _buildAvailabilityOption(TextString.availWeekends),
                            const SizedBox(height: 10),
                            _buildAvailabilityOption(TextString.availMorning),
                            const SizedBox(height: 10),
                            _buildAvailabilityOption(TextString.availAfternoon),
                            const SizedBox(height: 10),
                            _buildAvailabilityOption(TextString.availEvening),

                            const SizedBox(height: 20),

                            Text(
                              TextString.qualificationsLabel,
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                color: AppColors.blackColor,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _buildTextField(TextString.qualificationsHint, IconString.relevantQualification, controller.qualificationsController),

                            const SizedBox(height: 24),

                            SizedBox(
                              width: double.infinity,
                              child: AuthButton(
                                text: TextString.continueButton,
                                isTablet: isTablet,
                                onPressed: () {
                                  context.push(Routes.signupTutorial);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
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

  /// ------------- Helper Widgets ----------------- ///

  // Multiple Options
  Widget _buildMultiSelectOption(String title) {
    return Obx(() {
      bool isSelected = controller.selectedCleaningServices.contains(title);
      return GestureDetector(
        onTap: () => controller.toggleCleaningService(title),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.primaryColor : AppColors.secondaryColor,
                    width: isSelected ? 6 : 1.5,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // Availability option
  Widget _buildAvailabilityOption(String title) {
    return Obx(() {
      bool isSelected = controller.selectedAvailability.contains(title);
      return GestureDetector(
        onTap: () => controller.toggleAvailability(title),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? AppColors.primaryColor : AppColors.secondaryColor,
                    width: isSelected ? 6 : 1.5,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // TextField
  Widget _buildTextField(String hint, String svgIconPath, TextEditingController textController) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: textController,
        style: Theme.of(context).textTheme.titleMedium,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
            color: AppColors.secondaryColor,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              svgIconPath,
              width: 16,
              height: 16,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }
}