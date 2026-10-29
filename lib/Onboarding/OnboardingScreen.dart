import 'package:cleaning_app/Onboarding/OnboardingController.dart';
import 'package:cleaning_app/Onboarding/ReusableWidget/OnboardingButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController controller = Get.put(OnboardingController());

  late final List<Map<String, String>> onboardingData = [
    {
      'tag': TextString.tagOne,
      'subTitle': TextString.subTitleOne,
      'title': TextString.titleOne,
      'description': TextString.descOne,
      'image': ImageString.picOne,
    },
    {
      'tag': TextString.tagTwo,
      'subTitle': TextString.subTitleTwo,
      'title': TextString.titleTwo,
      'description': TextString.descTwo,
      'image': ImageString.picTwo,
    },
    {
      'tag': TextString.tagThree,
      'subTitle': TextString.subTitleThree,
      'title': TextString.titleThree,
      'description': TextString.descThree,
      'image': ImageString.picThree,
    },
  ];

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width >= 600; // Screen size check for mobile & tablet

    return Scaffold(
      backgroundColor: AppColors.backgroundOfScreenColor,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isTablet ? 550 : double.infinity,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isTablet ? 32.0 : 20.0,
                vertical: 16.0,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: controller.pageController,
                      itemCount: onboardingData.length,
                      onPageChanged: controller.updatePageIndicator,
                      itemBuilder: (context, index) {
                        final data = onboardingData[index];
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                data['image']!,
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) => Center(
                                  child: Icon(
                                    Icons.cleaning_services_rounded,
                                    size: 120,
                                    color: AppColors.primaryColor.withOpacity(0.5),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: AppColors.fieldColors,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  data['tag']!,
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                data['subTitle']!,
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              const SizedBox(height: 6),
                              Text(
                                data['title']!,
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontSize: isTablet ? 26 : 24,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                data['description']!,
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Column(
                      children: [
                        Obx(
                              () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onboardingData.length,
                                  (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                height: 6,
                                width: controller.currentIndex.value == index ? 22 : 6,
                                decoration: BoxDecoration(
                                  color: controller.currentIndex.value == index
                                      ? AppColors.primaryColor
                                      : AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(
                              () => OnboardingButtonWidget(
                            text: controller.currentIndex.value == 2
                                ? TextString.getStartedButton
                                : TextString.nextButton,
                            isTablet: isTablet,
                            onPressed: controller.handleNextButton,
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
      ),
    );
  }
}
