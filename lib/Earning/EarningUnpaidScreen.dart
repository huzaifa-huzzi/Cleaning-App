import 'package:cleaning_app/Earning/EarningController.dart';
import 'package:cleaning_app/Earning/ReusableWidget/EarningButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart' show ImageString;
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:cleaning_app/Sidebar/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';


class EarningUnpaidScreen extends StatefulWidget {
  const EarningUnpaidScreen({super.key});

  @override
  State<EarningUnpaidScreen> createState() => _EarningUnpaidScreenState();
}

class _EarningUnpaidScreenState extends State<EarningUnpaidScreen> {
  final EarningController controller = Get.isRegistered<EarningController>()
      ? Get.find<EarningController>()
      : Get.put(EarningController());

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
              maxWidth: isTablet ? 820 : double.infinity,
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
                                    TextString.unpaidCommissionTitle,
                                    style: textTheme.headlineLarge?.copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: isTablet ? 22 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    TextString.unpaidCommissionSubtitle,
                                    style: textTheme.titleSmall?.copyWith(
                                      color: AppColors.whiteColor.withValues(alpha: 0.8),
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
                    width: double.infinity,
                    padding: EdgeInsets.all(isTablet ? 24 : 18),
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
                              TextString.totalAmountToPayLabel,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 13 : 11,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 3,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.yellowColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                TextString.pendingBadgeText,
                                style: textTheme.bodySmall?.copyWith(
                                  fontSize: isTablet ? 12 : 10,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          TextString.unpaidAmountAudValue,
                          style: textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? 24 : 20,
                            color: AppColors.yellowColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Obx(() {
                    final int jobCount = controller.unpaidCashJobs.length;
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          TextString.unpaidCashJobsHeading,
                          style: textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? 20 : 16,
                            color: AppColors.blackColor,
                          ),
                        ),
                        Text(
                          '$jobCount jobs',
                          style: textTheme.titleSmall?.copyWith(
                            fontSize: isTablet ? 14 : 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    );
                  }),
                ),

                const SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Obx(() {
                    final String totalCommissionText =
                        '\$${controller.totalUnpaidAmount.toStringAsFixed(2)}';

                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(isTablet ? 24 : 18),
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
                        children: [
                          ...List.generate(controller.unpaidCashJobs.length, (index) {
                            final job = controller.unpaidCashJobs[index];
                            final String amountStr =
                                job['formattedCommission'] as String? ??
                                    TextString.unpaidJobCommissionNine;

                            return Padding(
                              padding: EdgeInsets.only(
                                bottom: index == controller.unpaidCashJobs.length - 1
                                    ? 0
                                    : 16,
                              ),
                              child: _buildUnpaidJobRow(
                                context: context,
                                textTheme: textTheme,
                                title: job['title'] as String? ?? '',
                                bookingId: job['bookingId'] as String? ?? '',
                                amount: amountStr,
                                isTablet: isTablet,
                              ),
                            );
                          }),
                          const Divider(height: 28),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                TextString.totalUnpaidCommissionLabel,
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: isTablet ? 16 : 14,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Text(
                                totalCommissionText,
                                style: textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: isTablet ? 18 : 15,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ),

                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Center(
                    child: EarningButton(
                      text: TextString.payOutstandingDuesButton,
                      isTablet: isTablet,
                      backgroundColor: AppColors.primaryColor,
                      onPressed: () {
                        context.push(Routes.earningSelectPayment);
                      },
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

  /// ----------------- Extra Widget ------------------ ///

   // unpaidJob Row
  Widget _buildUnpaidJobRow({
    required BuildContext context,
    required TextTheme textTheme,
    required String title,
    required String bookingId,
    required String amount,
    required bool isTablet,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: isTablet ? 16 : 14,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              bookingId,
              style: textTheme.titleSmall?.copyWith(
                fontSize: isTablet ? 13 : 11,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
        Text(
          amount,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: isTablet ? 16 : 14,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
