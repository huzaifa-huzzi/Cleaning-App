import 'package:cleaning_app/Booking/BookingController.dart';
import 'package:cleaning_app/Booking/ReusableWidget/BookingButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:cleaning_app/Sidebar/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth >= 600;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      endDrawer: const Sidebar(),
      backgroundColor: AppColors.backgroundOfScreenColor,
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isTablet ? 700 : double.infinity,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: isTablet ? 220 : 160,
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                TextString.myBookingsTitle,
                                style: textTheme.headlineLarge?.copyWith(
                                  color: AppColors.whiteColor,
                                  fontSize: isTablet ? 22 : 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                TextString.myBookingsSubtitle,
                                style: textTheme.titleSmall?.copyWith(
                                  color: AppColors.whiteColor.withValues(alpha: 0.8),
                                  fontSize: isTablet ? 14 : 12,
                                ),
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
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _buildTabButton(
                          context,
                          title: TextString.tabBooked,
                          index: 0,
                          isTablet: isTablet,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildTabButton(
                          context,
                          title: TextString.tabCompleted,
                          index: 1,
                          isTablet: isTablet,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: _buildTabButton(
                          context,
                          title: TextString.tabCancelled,
                          index: 2,
                          isTablet: isTablet,
                        ),
                      ),
                    ],
                  )),
                ),
                Obx(() {
                  if (controller.selectedTab.value == 1) {
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: isTablet ? 52 : 52,
                                  decoration: BoxDecoration(
                                    color: AppColors.containerBackground,
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: AppColors.primaryColor.withValues(alpha: 0.3),
                                      width: 1,
                                    ),
                                  ),
                                  child: TextField(
                                    controller: controller.searchController,
                                    cursorColor: AppColors.primaryColor,
                                    decoration: InputDecoration(
                                      hintText: TextString.searchBookingHint,
                                      hintStyle: textTheme.titleSmall?.copyWith(
                                        color: AppColors.secondaryColor,
                                        fontSize: isTablet ? 14 : 12,
                                      ),
                                      prefixIcon: const Icon(Icons.search, color: AppColors.secondaryColor),
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              GestureDetector(
                                onTap: () => controller.pickDate(context),
                                child: Container(
                                  height: isTablet ? 52 : 46,
                                  width: isTablet ? 52 : 46,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primaryColor.withValues(alpha: 0.3),
                                        blurRadius: 8,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      IconString.bookingScreenIcon,
                                      width: 22,
                                      height: 22,
                                      colorFilter: const ColorFilter.mode(
                                        AppColors.whiteColor,
                                        BlendMode.srcIn,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                }),

                const SizedBox(height: 10),

                Obx(() {
                  int currentTab = controller.selectedTab.value;
                  String badgeText;
                  Color badgeColor;

                  if (currentTab == 0) {
                    badgeText = TextString.activeBadge;
                    badgeColor = AppColors.mainGreenColor;
                  } else if (currentTab == 1) {
                    badgeText = TextString.completedBadge;
                    badgeColor = AppColors.mainGreenColor;
                  } else {
                    badgeText = TextString.cancelledBadge;
                    badgeColor = AppColors.redColor;
                  }

                  return ListView.builder(
                    itemCount: currentTab == 2 ? 2 : (currentTab == 1 ? 2 : 1),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 32 : 20,
                          vertical: 8,
                        ),
                        child: Container(
                          padding: EdgeInsets.all(isTablet ? 20 : 16),
                          decoration: BoxDecoration(
                            color: AppColors.containerBackground,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.blackColor.withValues(alpha: 0.05),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    TextString.sampleDate,
                                    style: textTheme.headlineSmall?.copyWith(
                                      fontSize: isTablet ? 13 : 11,
                                      color: AppColors.secondaryColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: badgeColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      badgeText,
                                      style: textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: isTablet ? 13 : 11,
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
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
                                        TextString.afterCommission,
                                        style: textTheme.titleSmall?.copyWith(
                                          fontSize: isTablet ? 12 : 10,
                                          color: AppColors.secondaryColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: isTablet ? 180 : 170,
                                    height: isTablet ? 42 : 40,
                                    child: BookingButton(
                                      text: TextString.viewBookingButton,
                                      isTablet: isTablet,
                                      onPressed: () {
                                        bool isCompletedTab = (controller.selectedTab.value == 1);
                                        context.push(
                                          Routes.bookingShowingScreen,
                                          extra: {'isCompleted': isCompletedTab},
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// ------------ Extra Widget --------------- ///

  // Tab Button
  Widget _buildTabButton(
      BuildContext context, {
        required String title,
        required int index,
        required bool isTablet,
      }) {
    bool isSelected = controller.selectedTab.value == index;

    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: isTablet ? 12 : 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.unselectedFilterColor,
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.whiteColor,
            fontSize: isTablet ? 14 : 12,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}