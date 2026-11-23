import 'package:cleaning_app/Earning/EarningController.dart';
import 'package:cleaning_app/Earning/ReusableWidget/EarningButton.dart';
import 'package:cleaning_app/Resources/Colors.dart' show AppColors;
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:cleaning_app/Sidebar/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class EarningScreen extends StatefulWidget {
  const EarningScreen({super.key});

  @override
  State<EarningScreen> createState() => _EarningScreenState();
}

class _EarningScreenState extends State<EarningScreen> {
  final EarningController controller = Get.put(EarningController());

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
              maxWidth: isTablet ? 1050 : double.infinity,
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
                                TextString.yourEarningsTitle,
                                style: textTheme.headlineLarge?.copyWith(
                                  color: AppColors.whiteColor,
                                  fontSize: isTablet ? 24 : 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                TextString.yourEarningsSubtitle,
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

                const SizedBox(height: 16),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        final date = controller.selectedDate.value;
                        return Row(
                          children: [
                            Text(
                              TextString.earningSectionTitle,
                              style: textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 22 : 17,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        );
                      }),
                      InkWell(
                        onTap: () => controller.pickDate(context),
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: EdgeInsets.all(isTablet ? 9 : 6),
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: SvgPicture.asset(
                            IconString.bookingScreenIcon,
                            width: isTablet ? 20 : 16,
                            height: isTablet ? 20 : 16,
                            colorFilter: ColorFilter.mode(
                              AppColors.whiteColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: isTablet
                      ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildTotalNetEarningsCard(context, textTheme, isTablet),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _buildOutstandingCommissionCard(context, textTheme, isTablet),
                      ),
                    ],
                  )
                      : Column(
                    children: [
                      _buildTotalNetEarningsCard(context, textTheme, isTablet),
                      const SizedBox(height: 16),
                      _buildOutstandingCommissionCard(context, textTheme, isTablet),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        TextString.earningSectionTitle,
                        style: textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 22 : 17,
                          color: AppColors.blackColor,
                        ),
                      ),
                      Obx(() => SizedBox(
                        height: isTablet ? 40 : 32,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: EdgeInsets.symmetric(horizontal: isTablet ? 18 : 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          onPressed: () => controller.toggleViewAll(),
                          child: Text(
                            controller.isShowAll.value
                                ? TextString.showLessButton
                                : TextString.viewAllButton,
                            style: textTheme.labelLarge?.copyWith(
                              color: AppColors.whiteColor,
                              fontSize: isTablet ? 13 : 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Obx(() {
                    final items = controller.isShowAll.value
                        ? controller.earningsList
                        : controller.earningsList.take(3).toList();

                    if (isTablet) {
                      return Wrap(
                        spacing: 16,
                        runSpacing: 12,
                        children: items.map((item) {
                          final bool isCredit = item['isCredit'] as bool;
                          return SizedBox(
                            width: (screenWidth.clamp(600, 1050) - 64 - 16) / 2,
                            child: _buildTransactionCard(
                              context: context,
                              title: item['title'] as String,
                              subtitle: item['subtitle'] as String,
                              amount: item['amount'] as String,
                              status: item['status'] as String,
                              isCredit: isCredit,
                              isTablet: isTablet,
                            ),
                          );
                        }).toList(),
                      );
                    }

                    return Column(
                      children: items.map((item) {
                        final bool isCredit = item['isCredit'] as bool;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _buildTransactionCard(
                            context: context,
                            title: item['title'] as String,
                            subtitle: item['subtitle'] as String,
                            amount: item['amount'] as String,
                            status: item['status'] as String,
                            isCredit: isCredit,
                            isTablet: isTablet,
                          ),
                        );
                      }).toList(),
                    );
                  }),
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

  // Net Earning Card
  Widget _buildTotalNetEarningsCard(
      BuildContext context,
      TextTheme textTheme,
      bool isTablet,
      ) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TextString.totalNetEarningsLabel,
            style: textTheme.titleSmall?.copyWith(
              fontSize: isTablet ? 13 : 11,
              color: AppColors.secondaryColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            TextString.totalNetEarningsValue,
            style: textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: isTablet ? 28 : 24,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            TextString.afterPlatformCommissionAud,
            style: textTheme.titleSmall?.copyWith(
              fontSize: isTablet ? 12 : 10,
              color: AppColors.secondaryColor,
            ),
          ),
          const Divider(height: 24),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TextString.thisMonthLabel,
                      style: textTheme.titleSmall?.copyWith(
                        fontSize: isTablet ? 12 : 10,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      TextString.thisMonthValue,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isTablet ? 18 : 15,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TextString.completedJobsLabel,
                      style: textTheme.titleSmall?.copyWith(
                        fontSize: isTablet ? 12 : 10,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      TextString.completedJobsValue,
                      style: textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: isTablet ? 18 : 15,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // date Commission Card
  Widget _buildOutstandingCommissionCard(
      BuildContext context,
      TextTheme textTheme,
      bool isTablet,
      ) {
    return Obx(() {
      final bool isPaid = controller.isDuesPaid.value;
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  TextString.outstandingCommissionLabel,
                  style: textTheme.titleSmall?.copyWith(
                    fontSize: isTablet ? 13 : 11,
                    color: AppColors.secondaryColor,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.redColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    TextString.unpaidBadgeText,
                    style: textTheme.bodySmall?.copyWith(
                      fontSize: isTablet ? 12 : 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              TextString.outstandingCommissionValue,
              style: textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: isTablet ? 24 : 20,
                color: AppColors.blackColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              TextString.commissionFromCashBookings,
              style: textTheme.titleSmall?.copyWith(
                fontSize: isTablet ? 12 : 10,
                color: AppColors.secondaryColor,
              ),
            ),
            const SizedBox(height: 16),
            EarningButton(
              text: TextString.payOutstandingDuesButton,
              isTablet: isTablet,
              backgroundColor: AppColors.primaryColor,
              onPressed: () => controller.payOutstandingDues(context),
            ),
          ],
        ),
      );
    });
  }

  // Transaction Card
  Widget _buildTransactionCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String amount,
    required String status,
    required bool isCredit,
    required bool isTablet,
  }) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 20 : 16,
        vertical: isTablet ? 16 : 14,
      ),
      decoration: BoxDecoration(
        color: AppColors.containerBackground,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            isCredit ? Icons.south_west : Icons.north_east,
            color: isCredit ? AppColors.mainGreenColor : AppColors.redColor,
            size: isTablet ? 20 : 16,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: isTablet ? 15 : 13,
                    color: AppColors.blackColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: textTheme.titleSmall?.copyWith(
                    fontSize: isTablet ? 12 : 10,
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: isTablet ? 15 : 13,
                  color: isCredit ? AppColors.mainGreenColor : AppColors.redColor,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                status,
                style: textTheme.titleSmall?.copyWith(
                  fontSize: isTablet ? 11 : 10,
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
