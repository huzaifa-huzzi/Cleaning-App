import 'package:cleaning_app/Profile/ProfileController.dart';
import 'package:cleaning_app/Profile/ReusableWidget/ProfileButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:cleaning_app/Sidebar/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


class ProfileVerifyNumber extends StatefulWidget {
  const ProfileVerifyNumber({super.key});

  @override
  State<ProfileVerifyNumber> createState() => _ProfileVerifyNumberState();
}

class _ProfileVerifyNumberState extends State<ProfileVerifyNumber> {
  final ProfileController controller = Get.isRegistered<ProfileController>()
      ? Get.find<ProfileController>()
      : Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    final rawPhone = controller.phoneController.text.trim();
    if (rawPhone.isNotEmpty) {
      controller.verificationTargetPhone.value =
      '${controller.selectedCode.value} $rawPhone';
    } else if (controller.phoneNumber.value.isNotEmpty) {
      controller.verificationTargetPhone.value = controller.phoneNumber.value;
    }
    controller.startOtpTimer(seconds: 30);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth >= 600;
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
              children: [
                Container(
                  width: double.infinity,
                  height: isTablet ? 220 : 160,
                  padding: EdgeInsets.only(
                    top: isTablet ? 58 : 48,
                    left: isTablet ? 28 : 14,
                    right: isTablet ? 28 : 16,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    image: DecorationImage(
                      image: AssetImage(ImageString.homebackgroundScreen),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              icon: Icon(
                                Icons.arrow_back,
                                color: AppColors.whiteColor,
                                size: isTablet ? 26 : 22,
                              ),
                              onPressed: () {
                                if (context.canPop()) {
                                  context.pop();
                                }
                              },
                            ),
                            SizedBox(width: isTablet ? 14 : 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    TextString.updateProfileTitle,
                                    style: textTheme.headlineLarge?.copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: isTablet ? 22 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    TextString.updateProfileSubtitle,
                                    style: textTheme.titleSmall?.copyWith(
                                      color: AppColors.whiteColor.withValues(alpha: 0.85),
                                      fontSize: isTablet ? 14 : 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                ),

                SizedBox(height: isTablet ? 28 : 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 18),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 32 : 18,
                      vertical: isTablet ? 30 : 24,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.photoBackground,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withValues(alpha: 0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImageString.profilePhone,
                          width: isTablet ? 64 : 52,
                          height: isTablet ? 64 : 52,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          TextString.verifyYourNumberTitle,
                          style: textTheme.headlineLarge?.copyWith(
                            fontSize: isTablet ? 24 : 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          TextString.verificationCodeSentPrefix,
                          textAlign: TextAlign.center,
                          style: textTheme.titleSmall?.copyWith(
                            fontSize: isTablet ? 14 : 12,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Obx(() {
                          return Text(
                            controller.verificationTargetPhone.value,
                            textAlign: TextAlign.center,
                            style: textTheme.bodyMedium?.copyWith(
                              fontSize: isTablet ? 15 : 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                            ),
                          );
                        }),

                        SizedBox(height: isTablet ? 24 : 20),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            TextString.enterSixDigitCodeLabel,
                            style: textTheme.titleMedium?.copyWith(
                              fontSize: isTablet ? 15 : 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.blackColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        _buildOtpBoxesRow(context, isTablet),

                        SizedBox(height: isTablet ? 22 : 18),
                        Obx(() {
                          return RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 14 : 12,
                                color: AppColors.secondaryColor,
                              ),
                              children: [
                                const TextSpan(text: TextString.didntReceiveCodeText),
                                if (!controller.canResendOtp.value)
                                  TextSpan(
                                    text:
                                    '${TextString.resendInPrefix}${controller.formattedResendTimer}',
                                    style: TextStyle(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                else
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.baseline,
                                    baseline: TextBaseline.alphabetic,
                                    child: GestureDetector(
                                      onTap: controller.resendVerificationCode,
                                      child: Text(
                                        TextString.resendCodeText,
                                        style: TextStyle(
                                          color: AppColors.primaryColor,
                                          fontSize: isTablet ? 14 : 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        }),

                        SizedBox(height: isTablet ? 22 : 18),
                        Center(
                          child: ProfileButton(
                            text: TextString.verifyNumberButton,
                            onPressed: () =>
                                controller.verifyNumberAndUpdateProfile(context),
                            isTablet: isTablet,
                            backgroundColor: AppColors.primaryColor,
                          ),
                        ),

                        SizedBox(height: isTablet ? 16 : 12),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: textTheme.titleSmall?.copyWith(
                              fontSize: isTablet ? 13 : 11,
                              color: AppColors.secondaryColor,
                            ),
                            children: [
                              const TextSpan(text: TextString.wrongNumberText),
                              WidgetSpan(
                                alignment: PlaceholderAlignment.baseline,
                                baseline: TextBaseline.alphabetic,
                                child: GestureDetector(
                                  onTap: () {
                                    if (context.canPop()) {
                                      context.pop();
                                    }
                                  },
                                  child: Text(
                                    TextString.goBackAndEditText,
                                    style: TextStyle(
                                      color: AppColors.secondaryColor,
                                      fontSize: isTablet ? 13 : 11,
                                      decoration: TextDecoration.underline,
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

   // otp Boxes
  Widget _buildOtpBoxesRow(BuildContext context, bool isTablet) {
    final textTheme = Theme.of(context).textTheme;
    final double boxWidth = isTablet ? 56 : 42;
    final double boxHeight = isTablet ? 60 : 48;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(ProfileController.otpLength, (index) {
        return SizedBox(
          width: boxWidth,
          height: boxHeight,
          child: TextFormField(
            controller: controller.otpControllers[index],
            focusNode: controller.otpFocusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            cursorColor: AppColors.primaryColor,
            style: textTheme.bodyMedium?.copyWith(
              fontSize: isTablet ? 20 : 16,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: AppColors.fieldColors,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 1.5,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.isNotEmpty) {
                if (index < ProfileController.otpLength - 1) {
                  controller.otpFocusNodes[index + 1].requestFocus();
                } else {
                  controller.otpFocusNodes[index].unfocus();
                }
              } else if (index > 0) {
                controller.otpFocusNodes[index - 1].requestFocus();
              }
            },
          ),
        );
      }),
    );
  }
}