import 'package:cleaning_app/Booking/BookingController.dart';
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


class BookingShowingScreen extends StatelessWidget {
  final bool isCompleted;

  BookingShowingScreen({super.key, this.isCompleted = false});

  final BookingController controller = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth >= 600;
    final textTheme = Theme.of(context).textTheme;

    bool completedCheck = isCompleted;
    if (Get.arguments != null && Get.arguments is Map) {
      completedCheck = Get.arguments['isCompleted'] ?? isCompleted;
    }

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
                                    TextString.bookingShowingTitle,
                                    style: textTheme.headlineLarge?.copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: isTablet ? 22 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    TextString.bookingShowingSubtitle,
                                    style: textTheme.titleSmall?.copyWith(
                                      color: AppColors.whiteColor.withOpacity(0.8),
                                      fontSize: isTablet ? 14 : 12,
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

                const SizedBox(height: 16),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Container(
                    padding: EdgeInsets.all(isTablet ? 24 : 18),
                    decoration: BoxDecoration(
                      color: AppColors.containerBackground,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.05),
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
                              TextString.jobIdText,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 13 : 11,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: completedCheck ? AppColors.completeBAckground : AppColors.bookedBackground,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                completedCheck ? TextString.completedStatusBadge : TextString.bookedStatusBadge,
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: isTablet ? 13 : 11,
                                  color: completedCheck ? AppColors.mainGreenColor :  AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          TextString.standardHomeCleaning,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? 20 : 16,
                            color: AppColors.blackColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, size: isTablet ? 18 : 14, color: AppColors.primaryColor),
                            const SizedBox(width: 4),
                            Text(
                              TextString.locationParramatta,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 14 : 12,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const Divider(height: 24),
                        Row(
                          children: [
                            Expanded(child: _buildInfoItem(context, iconPath: IconString.bookingScreenIcon, title: 'Date', value: 'Tomorrow', isTablet: isTablet)),
                            Expanded(child: _buildInfoItem(context, iconPath: IconString.startTime, title: 'Start time', value: '10:00 AM', isTablet: isTablet)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(child: _buildInfoItem(context, iconPath: IconString.homeScreenIcon, title: 'Property', value: '2-bedroom home', isTablet: isTablet)),
                            Expanded(child: _buildInfoItem(context, iconPath: IconString.durationIcon, title: 'Duration', value: 'Approx. 2 hours', isTablet: isTablet)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Container(
                    padding: EdgeInsets.all(isTablet ? 24 : 18),
                    decoration: BoxDecoration(
                      color: AppColors.containerBackground,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextString.cleaningRequirementsTitle,
                          style: textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? 18 : 15,
                            color: AppColors.blackColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildReqRow(context, TextString.reqKitchen, isTablet),
                        const SizedBox(height: 8),
                        _buildReqRow(context, TextString.reqBathroom, isTablet),
                        const SizedBox(height: 8),
                        _buildReqRow(context, TextString.reqVacuum, isTablet),
                        const SizedBox(height: 8),
                        _buildReqRow(context, TextString.reqDust, isTablet),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Container(
                    padding: EdgeInsets.all(isTablet ? 24 : 18),
                    decoration: BoxDecoration(
                      color: AppColors.containerBackground,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextString.customerDetailTitle,
                          style: textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? 18 : 15,
                            color: AppColors.blackColor,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: isTablet ? 26 : 22,
                              backgroundImage: AssetImage(ImageString.avatarIcon),
                            ),
                            const SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  TextString.userName,
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isTablet ? 16 : 14,
                                    color: AppColors.blackColor,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_border_rounded,
                                      color: AppColors.yellowColor,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '4.8 ',
                                      style: textTheme.titleSmall?.copyWith(
                                        fontSize: isTablet ? 14 : 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.yellowColor,
                                      ),
                                    ),
                                    Text(
                                      '(12 reviews)',
                                      style: textTheme.titleSmall?.copyWith(
                                        fontSize: isTablet ? 13 : 11,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        const Divider(height: 28),
                        Row(
                          children: [
                            SvgPicture.asset(
                              IconString.customerNotes,
                              width: isTablet ? 20 : 18,
                              height: isTablet ? 20 : 18,
                              colorFilter: const ColorFilter.mode(
                                AppColors.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              TextString.customerNotesLabel,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 14 : 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          TextString.customerNotesText,
                          style: textTheme.bodyMedium?.copyWith(
                            fontSize: isTablet ? 15 : 13,
                            color: AppColors.blackColor,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Container(
                    padding: EdgeInsets.all(isTablet ? 24 : 18),
                    decoration: BoxDecoration(
                      color: AppColors.containerBackground,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.05),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextString.yourEarningTitle,
                          style: textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? 18 : 15,
                            color: AppColors.blackColor,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Offered job price', style: textTheme.titleSmall?.copyWith(color: AppColors.secondaryColor)),
                            Text('\$90.00', style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.blackColor)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Platform commission (10%)', style: textTheme.titleSmall?.copyWith(color: AppColors.secondaryColor)),
                            Text('-\$9.00', style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.redColor)),
                          ],
                        ),
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Expected Earnings', style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: isTablet ? 16 : 14)),
                                Text('After 10% commission', style: textTheme.titleSmall?.copyWith(fontSize: 10, color: AppColors.secondaryColor)),
                              ],
                            ),
                            Text('\$81.00', style: textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: isTablet ? 22 : 18, color: AppColors.mainGreenColor)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                if (completedCheck) ...[
                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                    child: Container(
                      padding: EdgeInsets.all(isTablet ? 24 : 18),
                      decoration: BoxDecoration(
                        color: AppColors.containerBackground,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.blackColor.withOpacity(0.05),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            TextString.ratingExperienceTitle,
                            style: textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: isTablet ? 16 : 14,
                              color: AppColors.blackColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return IconButton(
                                onPressed: () => controller.setRating(index + 1),
                                icon: Icon(
                                  index < controller.selectedRating.value ? Icons.star : Icons.star_border,
                                  color: AppColors.yellowColor,
                                  size: isTablet ? 32 : 28,
                                ),
                              );
                            }),
                          )),
                          const SizedBox(height: 4),
                          Text(
                            'Tap to rate',
                            style: textTheme.titleSmall?.copyWith(fontSize: 11, color: AppColors.secondaryColor),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: isTablet ? 52 : 46,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              ),
                              onPressed: () => controller.submitRating(),
                              child: Text(
                                TextString.submitRatingButton,
                                style: textTheme.labelLarge?.copyWith(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: isTablet ? 16 : 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ] else ...[
                  const SizedBox(height: 24),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: isTablet ? 52 : 46,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () => controller.markReadyForPayment2(context),
                              child: Text(
                                TextString.markReadyButton,
                                style: textTheme.labelLarge?.copyWith(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: isTablet ? 14 : 11,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SizedBox(
                            height: isTablet ? 52 : 46,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(color: AppColors.primaryColor),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                              onPressed: () {
                                context.push(Routes.homeChatScreen);
                              },
                              child: Text(
                                TextString.chatWithCustomerButton,
                                style: textTheme.labelLarge?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: isTablet ? 14 : 12,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

   /// ------ Extra Widget -------------------- ///

  // Build Info Item
  Widget _buildInfoItem(
      BuildContext context, {
        required String iconPath,
        required String title,
        required String value,
        required bool isTablet,
      }) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        SvgPicture.asset(
          iconPath,
          width: isTablet ? 20 : 16,
          height: isTablet ? 20 : 16,
          colorFilter: const ColorFilter.mode(
            AppColors.primaryColor,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleSmall?.copyWith(
                fontSize: isTablet ? 12 : 10,
                color: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: isTablet ? 14 : 12,
                fontWeight: FontWeight.w600,
                color: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ],
    );
  }

   // Req Row
  Widget _buildReqRow(BuildContext context, String text, bool isTablet) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(Icons.check_circle_outline, size: isTablet ? 20 : 16, color: AppColors.mainGreenColor),
        const SizedBox(width: 8),
        Text(text, style: textTheme.titleSmall?.copyWith(fontSize: isTablet ? 14 : 12, color: AppColors.blackColor, fontWeight: FontWeight.w500)),
      ],
    );
  }
}