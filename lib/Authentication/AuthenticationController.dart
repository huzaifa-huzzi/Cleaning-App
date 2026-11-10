



import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Country {
  final String name;
  final String phoneCode;
  final String countryCode;

  Country({required this.name, required this.phoneCode, required this.countryCode});
}

class AuthenticationController extends GetxController {
    /// Login
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  var isLoadingCountries = false.obs;
  var isPasswordHidden = true.obs;
  var rememberMe = false.obs;
  var isConfirmPasswordHidden = true.obs;

  final List<TextEditingController> otpControllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> otpFocusNodes = List.generate(6, (index) => FocusNode());

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

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }


   /// Signup
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController fullNameSignupController = TextEditingController();
  final TextEditingController emailSignupController = TextEditingController();
  final TextEditingController legalFirstNameController = TextEditingController();
  final TextEditingController legalLastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController streetAddressController = TextEditingController();
  final TextEditingController postcodeController = TextEditingController();
  final TextEditingController customStateController = TextEditingController();

  var agreeTerms = false.obs;
  var selectedState = ''.obs;

  final Map<String, List<String>> countryStatesMap = {
    'Australia': [
      'New South Wales (NSW)',
      'Victoria (VIC)',
      'Queensland (QLD)',
      'Western Australia (WA)',
      'South Australia (SA)',
      'Tasmania (TAS)',
      'Australian Capital Territory (ACT)',
      'Northern Territory (NT)',
    ],
    'Pakistan': [
      'Punjab',
      'Sindh',
      'Khyber Pakhtunkhwa (KP)',
      'Balochistan',
      'Islamabad (ICT)',
      'Gilgit-Baltistan',
      'Azad Kashmir (AJK)',
    ],
    'India': [
      'Delhi',
      'Maharashtra',
      'Punjab',
      'Karnataka',
      'Tamil Nadu',
      'Uttar Pradesh',
      'Gujarat',
      'West Bengal',
    ],
    'United States': [
      'California (CA)',
      'Texas (TX)',
      'Florida (FL)',
      'New York (NY)',
      'Illinois (IL)',
      'Pennsylvania (PA)',
    ],
    'United Kingdom': [
      'England',
      'Scotland',
      'Wales',
      'Northern Ireland',
    ],
    'Canada': [
      'Ontario (ON)',
      'Quebec (QC)',
      'British Columbia (BC)',
      'Alberta (AB)',
    ],
    'United Arab Emirates': [
      'Abu Dhabi',
      'Dubai',
      'Sharjah',
      'Ajman',
      'Ras Al Khaimah',
      'Fujairah',
      'Umm Al Quwain',
    ],
  };

  List<String>? get currentStates {
    return countryStatesMap[selectedCountryName.value];
  }

  // Profile Image State for Signup Face Screen
  var profileImagePath = ''.obs;

// Image Pick Method (Camera / Gallery)
  Future<void> pickProfileImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source, imageQuality: 80);
    if (image != null) {
      profileImagePath.value = image.path;
    }
  }

// Remove Image Method
  void removeProfileImage() {
    profileImagePath.value = '';
  }

  var selectedIdentityType = 'Australian driver licence'.obs;
  var isIdentitySubmitted = false.obs; // False matlab first screen, True matlab second screen (upload fields wali)

// Document Image Paths
  var frontLicensePath = ''.obs;
  var backLicensePath = ''.obs;
  var passportPath = ''.obs;
  var otherDocumentPath = ''.obs;

// Method to pick document image
  Future<void> pickDocumentImage(String docType, ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: source, imageQuality: 80);
    if (image != null) {
      if (docType == 'front') frontLicensePath.value = image.path;
      if (docType == 'back') backLicensePath.value = image.path;
      if (docType == 'passport') passportPath.value = image.path;
      if (docType == 'other') otherDocumentPath.value = image.path;
    }
  }

// Method to remove document image
  void removeDocumentImage(String docType) {
    if (docType == 'front') frontLicensePath.value = '';
    if (docType == 'back') backLicensePath.value = '';
    if (docType == 'passport') passportPath.value = '';
    if (docType == 'other') otherDocumentPath.value = '';
  }

  var selectedRightToWorkType = ''.obs;
  var isRightToWorkSubmitted = false.obs;

  RxString citizenDocumentPath = ''.obs;
  RxString permanentResidentDocumentPath = ''.obs;
  RxString visaDocumentPath = ''.obs;

  void pickRightToWorkImage(String docType, ImageSource source) async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        if (docType == 'front' || docType == 'citizen') {
          citizenDocumentPath.value = pickedFile.path;
        } else if (docType == 'back' || docType == 'resident') {
          permanentResidentDocumentPath.value = pickedFile.path;
        } else if (docType == 'visa' || docType == 'other') {
          visaDocumentPath.value = pickedFile.path;
        }
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  void removeRightToWorkImage(String docType) {
    if (docType == 'front' || docType == 'citizen') {
      citizenDocumentPath.value = '';
    } else if (docType == 'back' || docType == 'resident') {
      permanentResidentDocumentPath.value = '';
    } else if (docType == 'visa' || docType == 'other') {
      visaDocumentPath.value = '';
    }
  }

  var selectedCleaningServices = <String>[].obs;
  var selectedAvailability = <String>[].obs;

  // Text controllers for inputs
  final TextEditingController cleaningExperienceController = TextEditingController();
  final TextEditingController serviceAreaController = TextEditingController();
  final TextEditingController qualificationsController = TextEditingController();

  // Toggle methods for multi-selection
  void toggleCleaningService(String service) {
    if (selectedCleaningServices.contains(service)) {
      selectedCleaningServices.remove(service);
    } else {
      selectedCleaningServices.add(service);
    }
  }

  void toggleAvailability(String slot) {
    if (selectedAvailability.contains(slot)) {
      selectedAvailability.remove(slot);
    } else {
      selectedAvailability.add(slot);
    }
  }


  late VideoPlayerController videoController;
  var isVideoInitialized = false.obs;
  var isTutorialWatched = false.obs;

  void initTutorialVideo() {
    videoController = VideoPlayerController.asset(ImageString.cleaningServiceVideo)
      ..initialize().then((_) {
        isVideoInitialized.value = true;
      });

    videoController.addListener(() {
      if (videoController.value.position >= videoController.value.duration &&
          !videoController.value.isPlaying) {
        isTutorialWatched.value = true;
      }
    });
  }

  void toggleVideoPlayPause() {
    if (videoController.value.isPlaying) {
      videoController.pause();
    } else {
      videoController.play();
    }
  }


  // --- Yeh variables apne AuthenticationController mein add karein ---
  RxBool agreeToTerms = false.obs;
  RxBool agreeToCommission = false.obs;
  RxBool agreeToPrivacy = false.obs;

// Getter jo check karega ke teeno checkboxes tick hain ya nahi
  RxBool get isAllPoliciesAccepted =>
      (agreeToTerms.value && agreeToCommission.value && agreeToPrivacy.value).obs;

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    searchController.dispose();
    confirmPasswordController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    legalFirstNameController.dispose();
    legalLastNameController.dispose();
    dobController.dispose();
    streetAddressController.dispose();
    postcodeController.dispose();
    customStateController.dispose();

    for (var c in otpControllers) {
      c.dispose();
    }
    for (var f in otpFocusNodes) {
      f.dispose();
    }

    super.onClose();
  }
}
