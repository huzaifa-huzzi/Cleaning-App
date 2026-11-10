import 'package:cleaning_app/Authentication/AuthenticationController.dart';
import 'package:cleaning_app/Authentication/ReusableWidget/AuthButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class SignupFace extends StatefulWidget {
  const SignupFace({super.key});

  @override
  State<SignupFace> createState() => _SignupFaceState();
}

class _SignupFaceState extends State<SignupFace> {
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
                                  context.go(Routes.signupDetailScreen);
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
                              '04 / 10',
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
                        'Put a Face to Your Profile',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: isTablet ? 28 : 24,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Customers can see your profile photo when reviewing your cleaner profile.',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 24),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.photoBackground,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          children: [
                            Image.asset(
                              ImageString.signupic,
                              width: 100,
                              height: 100,
                              errorBuilder: (context, error, stackTrace) => const Icon(
                                Icons.add_photo_alternate_rounded,
                                size: 48,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Obx(() {
                              if (controller.profileImagePath.value.isNotEmpty) {
                                return Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(16),
                                      child: Image.file(
                                        File(controller.profileImagePath.value),
                                        height: 220,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: controller.removeProfileImage,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                          padding: const EdgeInsets.all(6),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else {
                                return Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton.icon(
                                        onPressed: () => controller.pickProfileImage(ImageSource.camera),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.fieldColors,
                                          foregroundColor: AppColors.blackColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                        icon: SvgPicture.asset(
                                          IconString.cameraIcon,
                                          width: 20,
                                          height: 20,
                                          colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                                        ),
                                        label: Text(
                                          'Take Photo',
                                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton.icon(
                                        onPressed: () => controller.pickProfileImage(ImageSource.gallery),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.fieldColors,
                                          foregroundColor: AppColors.blackColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                          ),
                                        ),
                                        icon: SvgPicture.asset(
                                          IconString.galleryIcon,
                                          width: 20,
                                          height: 20,
                                          colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                                        ),
                                        label: Text(
                                          'Choose From Gallery',
                                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }
                            }),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: AuthButton(
                                text: 'Save and Continue',
                                isTablet: isTablet,
                                onPressed: () {
                                  context.push(Routes.signupIdentity);
                                },
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'You can update your photo later in your profile.',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                color: AppColors.primaryColor,
                                fontSize: 11,
                              ),
                              textAlign: TextAlign.center,
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
}