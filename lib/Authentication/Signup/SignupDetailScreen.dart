import 'package:cleaning_app/Authentication/AuthenticationController.dart';
import 'package:cleaning_app/Authentication/ReusableWidget/AuthButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


class SignupDetailScreen extends StatefulWidget {
  const SignupDetailScreen({super.key});

  @override
  State<SignupDetailScreen> createState() => _SignupDetailScreenState();
}

class _SignupDetailScreenState extends State<SignupDetailScreen> {
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
                                  context.go(Routes.signupVerify);
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
                                  color: Colors.black.withValues(alpha: 0.04),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Text(
                              TextString.signupDetailStep,
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
                        TextString.signupDetailTitle,
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: isTablet ? 28 : 24,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        TextString.signupDetailSubtitle,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 24),
                      Text(TextString.legalFirstNameLabel, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: controller.legalFirstNameController,
                        cursorColor: AppColors.blackColor,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.fieldColors,
                          hintText: TextString.legalFirstNameHint,
                          hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 13),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              IconString.user,
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                            ),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(TextString.legalLastNameLabel, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: controller.legalLastNameController,
                        cursorColor: AppColors.blackColor,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.fieldColors,
                          hintText: TextString.legalLastNameHint,
                          hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 13),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              IconString.user,
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                            ),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(TextString.dobLabel, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: controller.dobController,
                        keyboardType: TextInputType.datetime,
                        cursorColor: AppColors.blackColor,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.fieldColors,
                          hintText: TextString.dobHint,
                          hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 13),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              IconString.dob,
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                            ),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(TextString.residentialAddressLabel, style: Theme.of(context).textTheme.titleMedium),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: controller.streetAddressController,
                        cursorColor: AppColors.blackColor,
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.fieldColors,
                          hintText: TextString.streetAddressHint,
                          hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 13),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset(
                              IconString.Street,
                              width: 20,
                              height: 20,
                              colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                            ),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Obx(() {
                              final states = controller.currentStates;

                              if (states != null && states.isNotEmpty) {
                                return Container(
                                  height: 52,
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AppColors.fieldColors,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      value: states.contains(controller.selectedState.value)
                                          ? controller.selectedState.value
                                          : null,
                                      hint: Row(
                                        children: [
                                          SvgPicture.asset(
                                            IconString.state,
                                            width: 18,
                                            height: 18,
                                            colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                                          ),
                                          const SizedBox(width: 8),
                                          Expanded(
                                            child: Text(
                                              TextString.stateHint,
                                              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 13),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      items: states.map((String state) {
                                        return DropdownMenuItem<String>(
                                          value: state,
                                          child: Text(
                                            state,
                                            style: Theme.of(context).textTheme.bodyMedium,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        if (value != null) {
                                          controller.selectedState.value = value;
                                        }
                                      },
                                      buttonStyleData: const ButtonStyleData(height: 52, padding: EdgeInsets.zero),
                                      iconStyleData: const IconStyleData(
                                        icon: Icon(Icons.keyboard_arrow_down_rounded, size: 18, color: Colors.black54),
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        maxHeight: 250,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color: AppColors.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }

                              return TextFormField(
                                controller: controller.customStateController,
                                cursorColor: AppColors.blackColor,
                                style: Theme.of(context).textTheme.bodyMedium,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.fieldColors,
                                  hintText: TextString.stateHint,
                                  hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 13),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(
                                      IconString.state,
                                      width: 18,
                                      height: 18,
                                      colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                                    ),
                                  ),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                ),
                                onChanged: (val) {
                                  controller.selectedState.value = val;
                                },
                              );
                            }),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            flex: 6,
                            child: TextFormField(
                              controller: controller.postcodeController,
                              keyboardType: TextInputType.number,
                              cursorColor: AppColors.blackColor,
                              style: Theme.of(context).textTheme.bodyMedium,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: AppColors.fieldColors,
                                hintText: TextString.postcodeHint,
                                hintStyle: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 13),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: SvgPicture.asset(
                                    IconString.postState,
                                    width: 20,
                                    height: 20,
                                    colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
                                  ),
                                ),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      Center(
                        child: AuthButton(
                          text: TextString.saveAndContinueButton,
                          isTablet: isTablet,
                          onPressed: () {

                          },
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
