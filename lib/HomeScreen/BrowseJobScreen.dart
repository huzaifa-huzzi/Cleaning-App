import 'package:cleaning_app/HomeScreen/HomeController.dart' show HomeController;
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart' show ImageString;
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BrowseJobsScreen extends StatelessWidget {
  BrowseJobsScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth >= 600;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundOfScreenColor,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isTablet ? 700 : double.infinity,
            ),
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: isTablet ? 310 : 270,
                    ),
                    // Header Background Container
                    Container(
                      width: double.infinity,
                      height: isTablet ? 260 : 220,
                      padding: EdgeInsets.only(
                        top: isTablet ? 60 : 50,
                        left: isTablet ? 32 : 20,
                        right: isTablet ? 32 : 20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        image: DecorationImage(
                          image: AssetImage(ImageString.homebackgroundScreen),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: AppColors.whiteColor,
                                      size: isTablet ? 28 : 24,
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        TextString.availableJobsTitle,
                                        style: textTheme.headlineLarge?.copyWith(
                                          color: AppColors.whiteColor,
                                          fontSize: isTablet ? 20 : 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        TextString.findNextCleaningJob,
                                        style: textTheme.titleSmall?.copyWith(
                                          color: AppColors.whiteColor.withOpacity(0.7),
                                          fontSize: isTablet ? 14 : 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                                  IconButton(
                                    icon: SvgPicture.asset(
                                      IconString.menuIcon,
                                      width: isTablet ? 28 : 24,
                                      height: isTablet ? 28 : 24,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.whiteColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: isTablet ? 175 : 145,
                      left: isTablet ? 32 : 20,
                      right: isTablet ? 32 : 20,
                      child: Container(
                        padding: EdgeInsets.all(isTablet ? 24 : 18),
                        decoration: BoxDecoration(
                          color: AppColors.containerBackground,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blackColor.withOpacity(0.03),
                              blurRadius: 12,
                              spreadRadius: 0,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              TextString.yourAvailability,
                              style: textTheme.titleSmall?.copyWith(
                                color: AppColors.secondaryColor,
                                fontSize: isTablet ? 14 : 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              TextString.youAreOnline,
                              style: textTheme.headlineLarge?.copyWith(
                                color: AppColors.mainGreenColor,
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 22 : 18,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              TextString.newJobsAppearHere,
                              style: textTheme.titleSmall?.copyWith(
                                color: AppColors.secondaryColor,
                                fontSize: isTablet ? 14 : 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Obx(() => Row(
                    children: [
                      _buildFilterChip(context, TextString.filterAllJobs, 0, isTablet),
                      const SizedBox(width: 10),
                      _buildFilterChip(context, TextString.filterHomeCleaning, 1, isTablet),
                      const SizedBox(width: 10),
                      _buildFilterChip(context, TextString.filterDeepCleaning, 2, isTablet),
                    ],
                  )),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TextString.jobsNearServiceArea,
                        style: textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 18 : 16,
                          color: AppColors.blackColor,
                        ),
                      ),
                      Text(
                        TextString.jobsCountText,
                        style: textTheme.headlineSmall?.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: isTablet ? 14 : 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: isTablet ? 32 : 20,
                        vertical: 8,
                      ),
                      padding: EdgeInsets.all(isTablet ? 20 : 16),
                      decoration: BoxDecoration(
                        color: AppColors.containerBackground,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            TextString.sampleDate,
                            style: textTheme.headlineSmall?.copyWith(
                              fontSize: isTablet ? 13 : 11,
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            TextString.standardHomeCleaning,
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: isTablet ? 18 : 15,
                              color: AppColors.blackColor,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: isTablet ? 18 : 14,
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                TextString.locationParramatta,
                                style: textTheme.titleSmall?.copyWith(
                                  fontSize: isTablet ? 14 : 12,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Icon(
                                Icons.access_time,
                                size: isTablet ? 18 : 14,
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                TextString.durationHours,
                                style: textTheme.titleSmall?.copyWith(
                                  fontSize: isTablet ? 14 : 12,
                                  color: AppColors.secondaryColor,
                                ),
                              ),
                            ],
                          ),
                          const Divider(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    TextString.expectedEarnings,
                                    style: textTheme.titleSmall?.copyWith(
                                      fontSize: isTablet ? 13 : 11,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    TextString.sampleEarningsValue,
                                    style: textTheme.headlineLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: isTablet ? 20 : 16,
                                      color: AppColors.blackColor,
                                    ),
                                  ),
                                  Text(
                                    TextString.afterCommissionSubtitle,
                                    style: textTheme.titleSmall?.copyWith(
                                      fontSize: isTablet ? 12 : 10,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: isTablet ? 42 : 36,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    context.push(Routes.homeJobDetailScreen);
                                  },
                                  child: Text(
                                    TextString.viewDetailsButton,
                                    style: textTheme.labelLarge?.copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: isTablet ? 14 : 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ---------- Extra Widget -------------- ///

  // Filter chip
  Widget _buildFilterChip(BuildContext context, String label, int index, bool isTablet) {
    bool isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () {
        controller.changeFilterIndex(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 20 : 16,
          vertical: isTablet ? 12 : 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.unselectedFilterColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.whiteColor,
            fontSize: isTablet ? 14 : 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}