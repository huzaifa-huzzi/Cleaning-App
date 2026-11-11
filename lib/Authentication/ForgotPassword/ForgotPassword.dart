import 'package:cleaning_app/Authentication/AuthenticationController.dart';
import 'package:cleaning_app/Authentication/ReusableWidget/AuthButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:go_router/go_router.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final AuthenticationController controller = Get.put(AuthenticationController());

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
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.fieldColors,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
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
                              context.go(Routes.login);
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        TextString.forgotPasswordTitle,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: isTablet ? 28 : 24,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        TextString.forgotPasswordSubtitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 24),

                      _buildPhoneField(context, TextString.phoneNumberLabel),
                      const SizedBox(height: 32),

                      Center(
                        child: AuthButton(
                          text: TextString.forgotbutton,
                          isTablet: isTablet,
                          onPressed: () {
                            context.go(Routes.verifyNumber);
                          },
                        ),
                      ),
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

  /// ------------- Extra Widget ------------ ///

  // Flag Emoji
  String _getFlagEmoji(String countryCode) {
    return countryCode.toUpperCase().replaceAllMapped(
      RegExp(r'[A-Z]'),
          (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397),
    );
  }

  // Circle Flag
  Widget _buildCircleFlag(String countryCode) {
    return Text(
      _getFlagEmoji(countryCode),
      style: const TextStyle(fontSize: 20),
    );
  }
  Widget _buildSearchField(BuildContext context, TextEditingController searchController) {
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
  Widget _buildPhoneField(BuildContext context, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
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
            style: Theme.of(context).textTheme.bodyMedium,
            cursorColor: AppColors.blackColor,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.fieldColors,
              hintText: TextString.enterNumberHint,
              hintStyle: Theme.of(context).textTheme.titleLarge,
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
                          orElse: () => countries.firstWhere((c) => c.name == "Australia"),
                        ),
                        selectedItemBuilder: (context) {
                          return countries.map((Country country) {
                            return Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildCircleFlag(country.countryCode),
                                const SizedBox(width: 4),
                                const Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: AppColors.blackColor),
                                const SizedBox(width: 6),
                                Text(
                                  "+${country.phoneCode}",
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.blackColor,
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
                                _buildCircleFlag(country.countryCode),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    country.name,
                                    style: Theme.of(context).textTheme.bodyMedium,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "+${country.phoneCode}",
                                  style: Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (Country? value) {
                          if (value != null) {
                            controller.selectedCountryName.value = value.name;
                            controller.selectedCode.value = "+${value.phoneCode}";
                          }
                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 48,
                          padding: EdgeInsets.zero,
                        ),
                        iconStyleData: const IconStyleData(icon: SizedBox.shrink()),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 350,
                          width: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: AppColors.whiteColor,
                          ),
                          offset: const Offset(0, -5),
                        ),
                        dropdownSearchData: DropdownSearchData(
                          searchController: controller.searchController,
                          searchInnerWidgetHeight: 50,
                          searchInnerWidget: _buildSearchField(context, controller.searchController),
                          searchMatchFn: (item, searchValue) {
                            return item.value!.name.toLowerCase().contains(searchValue.toLowerCase()) ||
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
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          );
        }),
      ],
    );
  }
}
