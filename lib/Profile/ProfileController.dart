import 'dart:async';
import 'package:cleaning_app/Authentication/AuthenticationController.dart' show Country;
import 'package:cleaning_app/Profile/ReusableWidget/ProfileButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


class ProfileController extends GetxController {
  var profileImagePath = ImageString.avatarIcon.obs;
  var userName = 'Awais Ali'.obs;
  var userEmail = 'awais@gmail.com'.obs;
  var isVerifiedCleaner = true.obs;
  var fullName = 'Awais Ali'.obs;
  var phoneNumber = '+61 412 345 678'.obs;
  var personalEmail = 'sarah@email.com'.obs;
  var address = 'Parramatta, NSW'.obs;
  var cleaningServices = 'Awais Ali'.obs;
  var experience = '+61 412 345 678'.obs;
  var serviceArea = 'Parramatta, NSW'.obs;

  final GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  var isLoadingCountries = false.obs;
  var isUpdatingProfile = false.obs;
  var selectedCountryName = 'Australia'.obs;
  var selectedCode = '+61'.obs;

  final RxList<Country> countryList = <Country>[
    Country(name: 'Afghanistan', phoneCode: '93', countryCode: 'AF'),
    Country(name: 'Albania', phoneCode: '355', countryCode: 'AL'),
    Country(name: 'Algeria', phoneCode: '213', countryCode: 'DZ'),
    Country(name: 'Andorra', phoneCode: '376', countryCode: 'AD'),
    Country(name: 'Angola', phoneCode: '244', countryCode: 'AO'),
    Country(name: 'Argentina', phoneCode: '54', countryCode: 'AR'),
    Country(name: 'Armenia', phoneCode: '374', countryCode: 'AM'),
    Country(name: 'Australia', phoneCode: '61', countryCode: 'AU'),
    Country(name: 'Austria', phoneCode: '43', countryCode: 'AT'),
    Country(name: 'Azerbaijan', phoneCode: '994', countryCode: 'AZ'),
    Country(name: 'Bahrain', phoneCode: '973', countryCode: 'BH'),
    Country(name: 'Bangladesh', phoneCode: '880', countryCode: 'BD'),
    Country(name: 'Belarus', phoneCode: '375', countryCode: 'BY'),
    Country(name: 'Belgium', phoneCode: '32', countryCode: 'BE'),
    Country(name: 'Belize', phoneCode: '501', countryCode: 'BZ'),
    Country(name: 'Benin', phoneCode: '229', countryCode: 'BJ'),
    Country(name: 'Bhutan', phoneCode: '975', countryCode: 'BT'),
    Country(name: 'Bolivia', phoneCode: '591', countryCode: 'BO'),
    Country(name: 'Bosnia and Herzegovina', phoneCode: '387', countryCode: 'BA'),
    Country(name: 'Botswana', phoneCode: '267', countryCode: 'BW'),
    Country(name: 'Brazil', phoneCode: '55', countryCode: 'BR'),
    Country(name: 'Brunei', phoneCode: '673', countryCode: 'BN'),
    Country(name: 'Bulgaria', phoneCode: '359', countryCode: 'BG'),
    Country(name: 'Burkina Faso', phoneCode: '226', countryCode: 'BF'),
    Country(name: 'Burundi', phoneCode: '257', countryCode: 'BI'),
    Country(name: 'Cambodia', phoneCode: '855', countryCode: 'KH'),
    Country(name: 'Cameroon', phoneCode: '237', countryCode: 'CM'),
    Country(name: 'Canada', phoneCode: '1', countryCode: 'CA'),
    Country(name: 'Chad', phoneCode: '235', countryCode: 'TD'),
    Country(name: 'Chile', phoneCode: '56', countryCode: 'CL'),
    Country(name: 'China', phoneCode: '86', countryCode: 'CN'),
    Country(name: 'Colombia', phoneCode: '57', countryCode: 'CO'),
    Country(name: 'Congo', phoneCode: '242', countryCode: 'CG'),
    Country(name: 'Costa Rica', phoneCode: '506', countryCode: 'CR'),
    Country(name: 'Croatia', phoneCode: '385', countryCode: 'HR'),
    Country(name: 'Cuba', phoneCode: '53', countryCode: 'CU'),
    Country(name: 'Cyprus', phoneCode: '357', countryCode: 'CY'),
    Country(name: 'Czech Republic', phoneCode: '420', countryCode: 'CZ'),
    Country(name: 'Denmark', phoneCode: '45', countryCode: 'DK'),
    Country(name: 'Djibouti', phoneCode: '253', countryCode: 'DJ'),
    Country(name: 'Dominican Republic', phoneCode: '1', countryCode: 'DO'),
    Country(name: 'Ecuador', phoneCode: '593', countryCode: 'EC'),
    Country(name: 'Egypt', phoneCode: '20', countryCode: 'EG'),
    Country(name: 'El Salvador', phoneCode: '503', countryCode: 'SV'),
    Country(name: 'Estonia', phoneCode: '372', countryCode: 'EE'),
    Country(name: 'Ethiopia', phoneCode: '251', countryCode: 'ET'),
    Country(name: 'Fiji', phoneCode: '679', countryCode: 'FJ'),
    Country(name: 'Finland', phoneCode: '358', countryCode: 'FI'),
    Country(name: 'France', phoneCode: '33', countryCode: 'FR'),
    Country(name: 'Gabon', phoneCode: '241', countryCode: 'GA'),
    Country(name: 'Gambia', phoneCode: '220', countryCode: 'GM'),
    Country(name: 'Georgia', phoneCode: '995', countryCode: 'GE'),
    Country(name: 'Germany', phoneCode: '49', countryCode: 'DE'),
    Country(name: 'Ghana', phoneCode: '233', countryCode: 'GH'),
    Country(name: 'Greece', phoneCode: '30', countryCode: 'GR'),
    Country(name: 'Guatemala', phoneCode: '502', countryCode: 'GT'),
    Country(name: 'Honduras', phoneCode: '504', countryCode: 'HN'),
    Country(name: 'Hong Kong', phoneCode: '852', countryCode: 'HK'),
    Country(name: 'Hungary', phoneCode: '36', countryCode: 'HU'),
    Country(name: 'Iceland', phoneCode: '354', countryCode: 'IS'),
    Country(name: 'India', phoneCode: '91', countryCode: 'IN'),
    Country(name: 'Indonesia', phoneCode: '62', countryCode: 'ID'),
    Country(name: 'Iran', phoneCode: '98', countryCode: 'IR'),
    Country(name: 'Iraq', phoneCode: '964', countryCode: 'IQ'),
    Country(name: 'Ireland', phoneCode: '353', countryCode: 'IE'),
    Country(name: 'Israel', phoneCode: '972', countryCode: 'IL'),
    Country(name: 'Italy', phoneCode: '39', countryCode: 'IT'),
    Country(name: 'Jamaica', phoneCode: '1', countryCode: 'JM'),
    Country(name: 'Japan', phoneCode: '81', countryCode: 'JP'),
    Country(name: 'Jordan', phoneCode: '962', countryCode: 'JO'),
    Country(name: 'Kazakhstan', phoneCode: '7', countryCode: 'KZ'),
    Country(name: 'Kenya', phoneCode: '254', countryCode: 'KE'),
    Country(name: 'Kuwait', phoneCode: '965', countryCode: 'KW'),
    Country(name: 'Kyrgyzstan', phoneCode: '996', countryCode: 'KG'),
    Country(name: 'Latvia', phoneCode: '371', countryCode: 'LV'),
    Country(name: 'Lebanon', phoneCode: '961', countryCode: 'LB'),
    Country(name: 'Libya', phoneCode: '218', countryCode: 'LY'),
    Country(name: 'Lithuania', phoneCode: '370', countryCode: 'LT'),
    Country(name: 'Luxembourg', phoneCode: '352', countryCode: 'LU'),
    Country(name: 'Malaysia', phoneCode: '60', countryCode: 'MY'),
    Country(name: 'Maldives', phoneCode: '960', countryCode: 'MV'),
    Country(name: 'Malta', phoneCode: '356', countryCode: 'MT'),
    Country(name: 'Mauritius', phoneCode: '230', countryCode: 'MU'),
    Country(name: 'Mexico', phoneCode: '52', countryCode: 'MX'),
    Country(name: 'Monaco', phoneCode: '377', countryCode: 'MC'),
    Country(name: 'Mongolia', phoneCode: '976', countryCode: 'MN'),
    Country(name: 'Morocco', phoneCode: '212', countryCode: 'MA'),
    Country(name: 'Nepal', phoneCode: '977', countryCode: 'NP'),
    Country(name: 'Netherlands', phoneCode: '31', countryCode: 'NL'),
    Country(name: 'New Zealand', phoneCode: '64', countryCode: 'NZ'),
    Country(name: 'Nigeria', phoneCode: '234', countryCode: 'NG'),
    Country(name: 'Norway', phoneCode: '47', countryCode: 'NO'),
    Country(name: 'Oman', phoneCode: '968', countryCode: 'OM'),
    Country(name: 'Pakistan', phoneCode: '92', countryCode: 'PK'),
    Country(name: 'Palestine', phoneCode: '970', countryCode: 'PS'),
    Country(name: 'Panama', phoneCode: '507', countryCode: 'PA'),
    Country(name: 'Paraguay', phoneCode: '595', countryCode: 'PY'),
    Country(name: 'Peru', phoneCode: '51', countryCode: 'PE'),
    Country(name: 'Philippines', phoneCode: '63', countryCode: 'PH'),
    Country(name: 'Poland', phoneCode: '48', countryCode: 'PL'),
    Country(name: 'Portugal', phoneCode: '351', countryCode: 'PT'),
    Country(name: 'Qatar', phoneCode: '974', countryCode: 'QA'),
    Country(name: 'Romania', phoneCode: '40', countryCode: 'RO'),
    Country(name: 'Russia', phoneCode: '7', countryCode: 'RU'),
    Country(name: 'Saudi Arabia', phoneCode: '966', countryCode: 'SA'),
    Country(name: 'Senegal', phoneCode: '221', countryCode: 'SN'),
    Country(name: 'Serbia', phoneCode: '381', countryCode: 'RS'),
    Country(name: 'Singapore', phoneCode: '65', countryCode: 'SG'),
    Country(name: 'Slovakia', phoneCode: '421', countryCode: 'SK'),
    Country(name: 'Slovenia', phoneCode: '386', countryCode: 'SI'),
    Country(name: 'South Africa', phoneCode: '27', countryCode: 'ZA'),
    Country(name: 'South Korea', phoneCode: '82', countryCode: 'KR'),
    Country(name: 'Spain', phoneCode: '34', countryCode: 'ES'),
    Country(name: 'Sri Lanka', phoneCode: '94', countryCode: 'LK'),
    Country(name: 'Sudan', phoneCode: '249', countryCode: 'SD'),
    Country(name: 'Sweden', phoneCode: '46', countryCode: 'SE'),
    Country(name: 'Switzerland', phoneCode: '41', countryCode: 'CH'),
    Country(name: 'Syria', phoneCode: '963', countryCode: 'SY'),
    Country(name: 'Taiwan', phoneCode: '886', countryCode: 'TW'),
    Country(name: 'Tanzania', phoneCode: '255', countryCode: 'TZ'),
    Country(name: 'Thailand', phoneCode: '66', countryCode: 'TH'),
    Country(name: 'Tunisia', phoneCode: '216', countryCode: 'TN'),
    Country(name: 'Turkey', phoneCode: '90', countryCode: 'TR'),
    Country(name: 'Uganda', phoneCode: '256', countryCode: 'UG'),
    Country(name: 'Ukraine', phoneCode: '380', countryCode: 'UA'),
    Country(name: 'United Arab Emirates', phoneCode: '971', countryCode: 'AE'),
    Country(name: 'United Kingdom', phoneCode: '44', countryCode: 'GB'),
    Country(name: 'United States', phoneCode: '1', countryCode: 'US'),
    Country(name: 'Uruguay', phoneCode: '598', countryCode: 'UY'),
    Country(name: 'Uzbekistan', phoneCode: '998', countryCode: 'UZ'),
    Country(name: 'Venezuela', phoneCode: '58', countryCode: 'VE'),
    Country(name: 'Vietnam', phoneCode: '84', countryCode: 'VN'),
    Country(name: 'Yemen', phoneCode: '967', countryCode: 'YE'),
    Country(name: 'Zambia', phoneCode: '260', countryCode: 'ZM'),
    Country(name: 'Zimbabwe', phoneCode: '263', countryCode: 'ZW'),
  ].obs;

  String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return '${TextString.emailAddressLabel} is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  void onEditProfileTap(BuildContext context) {
      context.push(Routes.profileUpdateScreen);

  }

  void submitUpdateProfile(BuildContext context) {
    context.push(Routes.profileVerifyScreen);
    final formState = updateFormKey.currentState;
    if (formState == null || !formState.validate()) return;

    isUpdatingProfile.value = true;

    final updatedName = fullNameController.text.trim();
    final updatedEmail = emailController.text.trim();
    final rawPhone = phoneController.text.trim();
    final formattedPhone = '${selectedCode.value} $rawPhone'.trim();

    fullName.value = updatedName;
    userName.value = updatedName;
    personalEmail.value = updatedEmail;
    userEmail.value = updatedEmail;
    phoneNumber.value = formattedPhone;

    isUpdatingProfile.value = false;

    Get.snackbar(
      'Success',
      'Profile updated successfully',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.whiteColor,
    );

    if (context.canPop()) {
      context.pop();
    }
  }

  static const int otpLength = 6;

  final List<TextEditingController> otpControllers =
  List.generate(otpLength, (_) => TextEditingController());
  final List<FocusNode> otpFocusNodes =
  List.generate(otpLength, (_) => FocusNode());

  var resendSeconds = 30.obs;
  var canResendOtp = false.obs;
  var isVerifyingOtp = false.obs;
  var verificationTargetPhone = '+61 4XX XXX XXX'.obs;

  Timer? _resendTimer;

  void startOtpTimer({int seconds = 30}) {
    _resendTimer?.cancel();
    resendSeconds.value = seconds;
    canResendOtp.value = false;

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendSeconds.value > 1) {
        resendSeconds.value--;
      } else {
        resendSeconds.value = 0;
        canResendOtp.value = true;
        timer.cancel();
      }
    });
  }

  String get formattedResendTimer {
    final mins = (resendSeconds.value ~/ 60).toString().padLeft(2, '0');
    final secs = (resendSeconds.value % 60).toString().padLeft(2, '0');
    return '$mins:$secs';
  }

  String get enteredOtpCode =>
      otpControllers.map((c) => c.text.trim()).join();

  void clearOtpFields() {
    for (final c in otpControllers) {
      c.clear();
    }
    if (otpFocusNodes.isNotEmpty) {
      otpFocusNodes.first.requestFocus();
    }
  }

  void resendVerificationCode() {
    if (!canResendOtp.value) return;
    clearOtpFields();
    startOtpTimer(seconds: 30);

    Get.snackbar(
      'Code Sent',
      'A new verification code has been sent to ${verificationTargetPhone.value}',
      backgroundColor: AppColors.primaryColor,
      colorText: AppColors.whiteColor,
    );
  }

  void verifyNumberAndUpdateProfile(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width >= 600;
    showProfileEditedSuccessDialog(context, isTablet: isTablet);

      Get.snackbar(
        'Invalid Code',
        'Please enter the complete 6-digit verification code.',
        backgroundColor: AppColors.redColor,
        colorText: AppColors.whiteColor,
      );
      return;
  }

  void disposeOtpResources() {
    _resendTimer?.cancel();
    for (final c in otpControllers) {
      c.dispose();
    }
    for (final node in otpFocusNodes) {
      node.dispose();
    }
  }

  /// Dialog
  void showProfileEditedSuccessDialog(
      BuildContext context, {
        required bool isTablet,
      }) {
    final router = GoRouter.of(context);

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext dialogContext) {
        final textTheme = Theme.of(dialogContext).textTheme;

        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: AppColors.containerBackground,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isTablet ? 440 : double.infinity,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 32 : 24,
                vertical: isTablet ? 32 : 26,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: isTablet ? 86 : 74,
                    height: isTablet ? 86 : 74,
                    child: Image.asset(
                      ImageString.bookingDone,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.check_circle,
                          size: isTablet ? 80 : 68,
                          color: AppColors.mainGreenColor,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: isTablet ? 20 : 16),
                  Text(
                    TextString.profileEditedTitle,
                    style: textTheme.headlineLarge?.copyWith(
                      fontSize: isTablet ? 26 : 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.blackColor,
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isTablet ? 14 : 10),
                  Text(
                    TextString.profileEditedSubtitle,
                    style: textTheme.titleSmall?.copyWith(
                      fontSize: isTablet ? 15 : 13,
                      color: AppColors.secondaryColor,
                      height: 1.35,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: isTablet ? 28 : 22),
                  ProfileButton(
                    text: TextString.backToProfileButton,
                    onPressed: () {
                      Navigator.of(dialogContext).pop();
                      router.go(Routes.profileScreen);
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

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    searchController.dispose();
    super.onClose();
  }
}