import 'package:cleaning_app/Authentication/AuthenticationController.dart';
import 'package:cleaning_app/Profile/ProfileController.dart';
import 'package:cleaning_app/Profile/ReusableWidget/ProfileButton.dart';
import 'package:cleaning_app/Resources/Colors.dart' show AppColors;
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:cleaning_app/Sidebar/Sidebar.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  final ProfileController controller = Get.isRegistered<ProfileController>()
      ? Get.find<ProfileController>()
      : Get.put(ProfileController());

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
                      vertical: isTablet ? 28 : 22,
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
                    child: Form(
                      key: controller.updateFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImageString.updateProfile,
                            width: isTablet ? 68 : 56,
                            height: isTablet ? 68 : 56,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            TextString.updateProfileTitle,
                            style: textTheme.headlineLarge?.copyWith(
                              fontSize: isTablet ? 24 : 20,
                              fontWeight: FontWeight.bold,
                              color: AppColors.blackColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            TextString.updateProfileCardSubtitle,
                            textAlign: TextAlign.center,
                            style: textTheme.titleSmall?.copyWith(
                              fontSize: isTablet ? 14 : 12,
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          SizedBox(height: isTablet ? 24 : 20),
                          _buildLabeledTextField(
                            context: context,
                            label: TextString.fullNameLabel,
                            hint: TextString.enterFullNameHint,
                            textController: controller.fullNameController,
                            prefixSvgAsset: IconString.profileIcon,
                            isTablet: isTablet,
                            validator: (v) =>
                                controller.validateRequired(v, TextString.fullNameLabel),
                          ),
                          SizedBox(height: isTablet ? 18 : 14),
                          _buildLabeledTextField(
                            context: context,
                            label: TextString.emailAddressLabel,
                            hint: TextString.enterEmailAddressHint,
                            prefixIcon: Icons.mail_outline,
                            keyboardType: TextInputType.emailAddress,
                            isTablet: isTablet,
                            validator: controller.validateEmail, textController: controller.emailController,
                          ),
                          SizedBox(height: isTablet ? 18 : 14),
                          _buildPhoneField(
                            context,
                            TextString.phoneNumberLabel,
                            isTablet,
                          ),
                          SizedBox(height: isTablet ? 28 : 22),
                          Center(
                            child: ProfileButton(
                              text: TextString.updateProfileButton,
                              onPressed: () => controller.submitUpdateProfile(context),
                              isTablet: isTablet,
                              backgroundColor: AppColors.primaryColor,
                            ),
                          ),
                        ],
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

  /// ----------------- Extra Widgets ------------------ ///

   // Labeled Field Text
  Widget _buildLabeledTextField({
    required BuildContext context,
    required String label,
    required String hint,
    required TextEditingController textController,
    IconData? prefixIcon,
    String? prefixSvgAsset,
    required bool isTablet,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final double iconSize = isTablet ? 22 : 19;

    Widget? leadingWidget;
    if (prefixSvgAsset != null && prefixSvgAsset.isNotEmpty) {
      leadingWidget = Padding(
        padding: EdgeInsets.all(isTablet ? 12 : 10),
        child: SvgPicture.asset(
          prefixSvgAsset,
          width: iconSize,
          height: iconSize,
          colorFilter: const ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
      );
    } else if (prefixIcon != null) {
      leadingWidget = Icon(
        prefixIcon,
        size: iconSize,
        color: AppColors.primaryColor,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.titleMedium?.copyWith(
            fontSize: isTablet ? 15 : 13,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: textController,
          keyboardType: keyboardType,
          validator: validator,
          style: textTheme.bodyMedium?.copyWith(
            fontSize: isTablet ? 15 : 13,
            color: AppColors.blackColor,
          ),
          cursorColor: AppColors.blackColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.fieldColors,
            hintText: hint,
            hintStyle: textTheme.titleLarge?.copyWith(
              fontSize: isTablet ? 14 : 12,
              color: AppColors.secondaryColor,
            ),
            prefixIcon: leadingWidget,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: isTablet ? 18 : 14,
              vertical: isTablet ? 16 : 14,
            ),
          ),
        ),
      ],
    );
  }

  // Flag Emoji
  String _getFlagEmoji(String countryCode) {
    return countryCode.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
    );
  }

  // Circle Flag
  Widget _buildCircleFlag(String countryCode, {required bool isTablet}) {
    return Text(
      _getFlagEmoji(countryCode),
      style: TextStyle(fontSize: isTablet ? 22 : 20),
    );
  }

  // Search Field
  Widget _buildSearchField(
      BuildContext context,
      TextEditingController searchController,
      bool isTablet,
      ) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        cursorColor: AppColors.blackColor,
        controller: searchController,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          isDense: true,
          fillColor: AppColors.backgroundOfScreenColor,
          filled: true,
          hintText: TextString.searchHint,
          hintStyle: Theme.of(context).textTheme.titleLarge,
          prefixIcon: const Icon(Icons.search, size: 18, color: AppColors.primaryColor),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
        ),
      ),
    );
  }

  // Phone Field
  Widget _buildPhoneField(BuildContext context, String label, bool isTablet) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.titleMedium?.copyWith(
            fontSize: isTablet ? 15 : 13,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 6),
        Obx(() {
          if (controller.isLoadingCountries.value) {
            return const SizedBox(
              height: 48,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                ),
              ),
            );
          }

          final List<Country> countries = controller.countryList;

          return TextFormField(
            controller: controller.phoneController,
            keyboardType: TextInputType.phone,
            validator: (v) => controller.validateRequired(v, TextString.phoneNumberLabel),
            style: textTheme.bodyMedium?.copyWith(
              fontSize: isTablet ? 15 : 13,
              color: AppColors.blackColor,
            ),
            cursorColor: AppColors.blackColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.fieldColors,
              hintText: TextString.enterNumberHint,
              hintStyle: textTheme.titleLarge?.copyWith(
                fontSize: isTablet ? 14 : 12,
                color: AppColors.secondaryColor,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<Country>(
                        isExpanded: false,
                        value: countries.firstWhere(
                              (c) => c.name == controller.selectedCountryName.value,
                          orElse: () => countries.firstWhere((c) => c.name == 'Australia'),
                        ),
                        selectedItemBuilder: (context) {
                          return countries.map((Country country) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildCircleFlag(country.countryCode, isTablet: isTablet),
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 18,
                                  color: AppColors.blackColor,
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '+${country.phoneCode}',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            );
                          }).toList();
                        },
                        items: countries.map((Country country) {
                          return DropdownMenuItem<Country>(
                            value: country,
                            child: Row(
                              children: [
                                _buildCircleFlag(country.countryCode, isTablet: isTablet),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    country.name,
                                    style: textTheme.bodyMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  '+${country.phoneCode}',
                                  style: textTheme.titleMedium,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (Country? value) {
                          if (value != null) {
                            controller.selectedCountryName.value = value.name;
                            controller.selectedCode.value = '+${value.phoneCode}';
                          }
                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 48,
                          padding: EdgeInsets.zero,
                        ),
                        iconStyleData: const IconStyleData(icon: SizedBox.shrink()),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 350,
                          width: isTablet ? 320 : 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.whiteColor,
                          ),
                          offset: const Offset(0, -5),
                        ),
                        dropdownSearchData: DropdownSearchData(
                          searchController: controller.searchController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: _buildSearchField(
                            context,
                            controller.searchController,
                            isTablet,
                          ),
                          searchMatchFn: (item, searchValue) {
                            return item.value!.name
                                .toLowerCase()
                                .contains(searchValue.toLowerCase()) ||
                                item.value!.phoneCode.contains(searchValue);
                          },
                        ),
                        onMenuStateChange: (isOpen) {
                          if (!isOpen) {
                            controller.searchController.clear();
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.primaryColor, width: 1),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: isTablet ? 18 : 16,
                vertical: isTablet ? 16 : 14,
              ),
            ),
          );
        }),
      ],
    );
  }
}