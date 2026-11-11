import 'package:cleaning_app/Authentication/AuthenticationController.dart';
import 'package:cleaning_app/Authentication/ReusableWidget/AuthButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';


class SignupIdentity extends StatefulWidget {
  const SignupIdentity({super.key});

  @override
  State<SignupIdentity> createState() => _SignupIdentityState();
}

class _SignupIdentityState extends State<SignupIdentity> {
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
                                if (controller.isIdentitySubmitted.value) {
                                  controller.isIdentitySubmitted.value = false;
                                } else {
                                  if (Navigator.canPop(context)) {
                                    Navigator.pop(context);
                                  } else {
                                    context.go(Routes.signupFaceScreen);
                                  }
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
                              TextString.signupIdentityStep,
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
                        TextString.signupIdentityTitle,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: isTablet ? 28 : 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Obx(() => Text(
                        controller.isIdentitySubmitted.value
                            ? TextString.secureInfoSubtitle
                            : TextString.signupIdentitySubtitle,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 13,
                          color: AppColors.secondaryColor,
                          height: 1.4,
                        ),
                      )),
                      const SizedBox(height: 24),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.fieldColors.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Obx(() {
                          if (!controller.isIdentitySubmitted.value) {
                            return Column(
                              children: [
                                Image.asset(ImageString.verifyIdentityPic, width: 100, height: 100),
                                const SizedBox(height: 20),
                                _buildRadioOption(TextString.optionAussieLicence, IconString.driverLicense),
                                const SizedBox(height: 12),
                                _buildRadioOption(TextString.optionPassport, IconString.passport),
                                const SizedBox(height: 12),
                                _buildRadioOption(TextString.optionOtherDocument, IconString.otherDocument),
                                const SizedBox(height: 24),
                                SizedBox(
                                  width: double.infinity,
                                  child: AuthButton(
                                    text: TextString.continueToVerification,
                                    isTablet: isTablet,
                                    onPressed: () {
                                      controller.isIdentitySubmitted.value = true;
                                    },
                                  ),
                                ),
                              ],
                            );
                          } else {
                            String type = controller.selectedIdentityType.value;

                            if (type == TextString.optionAussieLicence) {
                              return Column(
                                children: [
                                  Image.asset(ImageString.verifyIdentityPic, width: 100, height: 100),
                                  const SizedBox(height: 12),
                                  Text(
                                    TextString.secureInfoTitle,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    TextString.secureInfoDescription,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      color: Colors.grey.shade500,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  _buildUploadBox(TextString.uploadFrontLicense, 'front', controller.frontLicensePath),
                                  const SizedBox(height: 16),
                                  _buildUploadBox(TextString.uploadBackLicense, 'back', controller.backLicensePath),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
                                    child: AuthButton(
                                      text: TextString.continueToVerification,
                                      isTablet: isTablet,
                                      onPressed: () {
                                        context.push(Routes.signupConfirmIdentity);
                                      },
                                    ),
                                  ),
                                ],
                              );
                            } else if (type == TextString.optionPassport) {
                              return Column(
                                children: [
                                  Image.asset(ImageString.verifyIdentityPic, width: 100, height: 100),
                                  const SizedBox(height: 12),
                                  Text(
                                    TextString.secureInfoTitle,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    TextString.secureInfoDescription,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      color: Colors.grey.shade500,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  _buildUploadBox(TextString.uploadPassportPage, 'passport', controller.passportPath),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
                                    child: AuthButton(
                                      text: TextString.continueToVerification,
                                      isTablet: isTablet,
                                      onPressed: () {
                                        context.push(Routes.signupConfirmIdentity);
                                      },
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return Column(
                                children: [
                                  Image.asset(ImageString.verifyIdentityPic, width: 100, height: 100),
                                  const SizedBox(height: 12),
                                  Text(
                                    TextString.secureInfoTitle,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    TextString.secureInfoDescription,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                      color: Colors.grey.shade500,
                                      fontSize: 11,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  _buildUploadBox(TextString.uploadIdentityDoc, 'other', controller.otherDocumentPath),
                                  const SizedBox(height: 24),
                                  SizedBox(
                                    width: double.infinity,
                                    child: AuthButton(
                                      text: TextString.continueToVerification,
                                      isTablet: isTablet,
                                      onPressed: () {
                                        // Action here if needed
                                      },
                                    ),
                                  ),
                                ],
                              );
                            }
                          }
                        }),
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

  /// ------------- Extra Widget ----------------- ///

  // Widget for Radio Options Selection Screen
  Widget _buildRadioOption(String title, String svgPath) {
    bool isSelected = controller.selectedIdentityType.value == title;
    return GestureDetector(
      onTap: () {
        controller.selectedIdentityType.value = title;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey.shade300,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              width: 20,
              height: 20,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
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
            Radio<String>(
              value: title,
              groupValue: controller.selectedIdentityType.value,
              activeColor: AppColors.primaryColor,
              onChanged: (val) {
                if (val != null) {
                  controller.selectedIdentityType.value = val;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget for Upload Box
  Widget _buildUploadBox(String label, String docType, RxString pathRx) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                IconString.licenseFront,
                width: 16,
                height: 16,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Obx(() {
            if (pathRx.value.isNotEmpty) {
              return Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(pathRx.value),
                      height: 130,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: GestureDetector(
                      onTap: () => controller.removeDocumentImage(docType),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(Icons.close, color: AppColors.whiteColor, size: 16),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return InkWell(
                onTap: () {
                  controller.pickDocumentImage(docType, ImageSource.gallery);
                },
                child: Container(
                  height: 56,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.fieldColors,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primaryColor),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        IconString.cameraIcon,
                        width: 16,
                        height: 16,
                        colorFilter: const ColorFilter.mode(
                          AppColors.primaryColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        TextString.uploadPhoto,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}


