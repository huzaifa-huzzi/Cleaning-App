import 'package:cleaning_app/Authentication/AuthenticationController.dart';
import 'package:cleaning_app/Authentication/ReusableWidget/AuthButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:video_player/video_player.dart';


class SignupTutorial extends StatefulWidget {
  const SignupTutorial({super.key});

  @override
  State<SignupTutorial> createState() => _SignupTutorialState();
}

class _SignupTutorialState extends State<SignupTutorial> {
  final AuthenticationController controller = Get.find<AuthenticationController>();

  @override
  void initState() {
    super.initState();
    controller.initTutorialVideo();
  }

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
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back, color: AppColors.primaryColor, size: 20),
                              onPressed: () {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                } else {
                                  context.go(Routes.signupCleaning);
                                }
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: AppColors.fieldColors,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              '08 / 10',
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
                        'Your Guide to Cleaning',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: isTablet ? 28 : 24,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Watch the video and review the essential guidelines before accepting your first job.',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 24),

                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppColors.fieldColors,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(color: Colors.grey.shade200),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                height: 180,
                                width: double.infinity,
                                color: Colors.black12,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Obx(() {
                                      if (controller.isVideoInitialized.value) {
                                        return VideoPlayer(controller.videoController);
                                      } else {
                                        return const Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    }),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          controller.toggleVideoPlayPause();
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: const BoxDecoration(
                                          color: AppColors.primaryColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          controller.videoController.value.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: AppColors.whiteColor,
                                          size: 32,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            Text(
                              'Topics to Review',
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Understand these key guidelines before getting started.',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 16),

                            _buildReviewItem('Understanding Job Requests'),
                            const SizedBox(height: 10),
                            _buildReviewItem('10% Platform Commission'),
                            const SizedBox(height: 10),
                            _buildReviewItem('Cleaning Standards & Safety'),
                            const SizedBox(height: 10),
                            _buildReviewItem('Cancellations & Punctuality'),
                            const SizedBox(height: 10),
                            _buildReviewItem('Complaints & Reporting'),

                            const SizedBox(height: 24),

                            Obx(() => SizedBox(
                              width: double.infinity,
                              child: AuthButton(
                                text: 'Complete tutorial',
                                isTablet: isTablet,
                                onPressed: controller.isTutorialWatched.value
                                    ? () {
                                     context.push(Routes.signupTerms);
                                }
                                    : () {
                                  Get.snackbar(
                                    'Notice',
                                    'Please watch the complete video to continue.',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                },
                              ),
                            )),
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
   /// -------------- Extra Widget ----------------- ///

   // Review Item
  Widget _buildReviewItem(String title) {
    return Row(
      children: [
        const Icon(Icons.check, size: 16, color: Colors.green),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }
}