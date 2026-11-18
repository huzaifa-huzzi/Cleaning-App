import 'package:cleaning_app/HomeScreen/HomeController.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart' show IconString;
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:cleaning_app/Sidebar/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class HomeJobDetailScreen extends StatefulWidget {
  const HomeJobDetailScreen({super.key});

  @override
  State<HomeJobDetailScreen> createState() => _HomeJobDetailScreenState();
}

class _HomeJobDetailScreenState extends State<HomeJobDetailScreen> {

  final HomeController controller = Get.put(HomeController(), permanent: true);

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
                  height: isTablet ? 220 : 150,
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
                                    TextString.jobDetailTitle,
                                    style: textTheme.headlineLarge?.copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: isTablet ? 20 : 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    TextString.jobDetailSubtitle,
                                    style: textTheme.titleSmall?.copyWith(
                                      color: AppColors.whiteColor.withValues(alpha: 0.7),
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
                          color: AppColors.blackColor.withValues(alpha: 0.08),
                          blurRadius: 15,
                          spreadRadius: 1,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                TextString.availableJobBadge,
                                style: textTheme.titleSmall?.copyWith(
                                  color: AppColors.primaryColor,
                                  fontSize: isTablet ? 13 : 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Text(
                              TextString.jobIdText,
                              style: textTheme.titleSmall?.copyWith(
                                color: AppColors.secondaryColor,
                                fontSize: isTablet ? 13 : 11,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          TextString.jobTitleStandard,
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: isTablet ? 20 : 16,
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
                          ],
                        ),
                        const Divider(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: _buildInfoItem(
                                context,
                                title: TextString.labelDate,
                                value: TextString.valueTomorrow,
                                isTablet: isTablet,
                                iconPath: IconString.bookingScreenIcon,
                              ),
                            ),
                            Expanded(
                              child: _buildInfoItem(
                                context,
                                iconPath: IconString.startTime,
                                title: TextString.labelStartTime,
                                value: TextString.valueStartTime,
                                isTablet: isTablet,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _buildInfoItem(
                                context,
                                iconPath: IconString.homeScreenIcon,
                                title: TextString.labelProperty,
                                value: TextString.valueProperty,
                                isTablet: isTablet,
                              ),
                            ),
                            Expanded(
                              child: _buildInfoItem(
                                context,
                                iconPath: IconString.durationIcon,
                                title: TextString.labelDuration,
                                value: TextString.valueDuration,
                                isTablet: isTablet,
                              ),
                            ),
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
                          color: AppColors.blackColor.withValues(alpha: 0.08),
                          blurRadius: 15,
                          spreadRadius: 1,
                          offset: const Offset(0, 6),
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
                        _buildRequirementRow(context, TextString.reqKitchen, isTablet),
                        const SizedBox(height: 8),
                        _buildRequirementRow(context, TextString.reqBathroom, isTablet),
                        const SizedBox(height: 8),
                        _buildRequirementRow(context, TextString.reqVacuum, isTablet),
                        const SizedBox(height: 8),
                        _buildRequirementRow(context, TextString.reqDust, isTablet),
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
                          color: AppColors.blackColor.withValues(alpha: 0.08),
                          blurRadius: 15,
                          spreadRadius: 1,
                          offset: const Offset(0, 6),
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
                            Text(
                              TextString.offeredJobPriceLabel,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 14 : 12,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            Text(
                              TextString.offeredJobPriceValue,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 14 : 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              TextString.platformCommissionLabel,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 14 : 12,
                                color: AppColors.secondaryColor,
                              ),
                            ),
                            Text(
                              TextString.platformCommissionValue,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 12 : 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.redColor,
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
                                  TextString.expectedEarningsTitle,
                                  style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isTablet ? 16 : 14,
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
                            Text(
                              TextString.expectedEarningsValue,
                              style: textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 22 : 18,
                                color: AppColors.mainGreenColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: HomeButton(
                    text: TextString.chatWithCustomerButton,
                    onPressed: () {
                      context.push(Routes.homeChatScreen);
                    },
                    isTablet: isTablet,
                    backgroundColor: Colors.transparent,
                    textColor: AppColors.primaryColor,
                    hasBorder: true,
                  ),
                ),

                const SizedBox(height: 12),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: HomeButton(
                          text: TextString.acceptJobButton,
                          onPressed: () {
                            showAcceptJobDialog(context, isTablet: isTablet);
                          },
                          isTablet: isTablet,
                          backgroundColor: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: HomeButton(
                          text: TextString.declineJobButton,
                          onPressed: () {},
                          isTablet: isTablet,
                          backgroundColor: AppColors.redColor,
                        ),
                      ),
                    ],
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

  /// --------------- Extra Widget -------------------- ///

  // Info Item
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
          width: isTablet ? 22 : 18,
          height: isTablet ? 22 : 18,
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

   // Requirment Row
  Widget _buildRequirementRow(BuildContext context, String text, bool isTablet) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(
          Icons.check_circle_outline,
          size: isTablet ? 20 : 16,
          color: AppColors.mainGreenColor,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: textTheme.titleSmall?.copyWith(
            fontSize: isTablet ? 14 : 12,
            color: AppColors.blackColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

/// Dialogs Section
void showAcceptJobDialog(BuildContext context, {required bool isTablet}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final textTheme = Theme.of(context).textTheme;

      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: AppColors.containerBackground,
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 28 : 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: isTablet ? 70 : 60,
                height: isTablet ? 70 : 60,
                child: Image.asset(
                  ImageString.calendarIcon,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                TextString.acceptDialogTitle,
                style: textTheme.headlineLarge?.copyWith(
                  fontSize: isTablet ? 22 : 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                TextString.acceptDialogSubtitle,
                style: textTheme.titleSmall?.copyWith(
                  fontSize: isTablet ? 14 : 12,
                  color: AppColors.secondaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: HomeButton(
                      text: TextString.dialogAcceptBtn,
                      onPressed: () {
                        Navigator.pop(context);
                        showJobAcceptedSuccessDialog(context, isTablet: isTablet);
                      },
                      isTablet: isTablet,
                      backgroundColor: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: HomeButton(
                      text: TextString.dialogCancelBtn,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      isTablet: isTablet,
                      backgroundColor: AppColors.redColor,
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
}

void showJobAcceptedSuccessDialog(
    BuildContext context, {
      required bool isTablet,
    }) {
  final router = GoRouter.of(context);

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext dialogContext) {
      final textTheme = dialogContext.textTheme;

      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: AppColors.containerBackground,
        child: Padding(
          padding: EdgeInsets.all(isTablet ? 28 : 22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: isTablet ? 80 : 70,
                height: isTablet ? 80 : 70,
                child: Image.asset(
                  ImageString.loginDialogPic,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                TextString.successDialogTitle,
                style: dialogContext.textTheme.headlineLarge?.copyWith(
                  fontSize: isTablet ? 22 : 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                  height: 1.2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                TextString.successDialogSubtitle,
                style: dialogContext.textTheme.titleSmall?.copyWith(
                  fontSize: isTablet ? 14 : 12,
                  color: AppColors.secondaryColor,
                  height: 1.3,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              HomeButton(
                text: TextString.backToDashboardBtn,
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  router.go(Routes.homeScreen);
                },
                isTablet: isTablet,
                backgroundColor: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// ----------------- Reusable HomeButton Widget ----------------- ///
class HomeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isTablet;
  final Color? backgroundColor;
  final Color? textColor;
  final bool hasBorder;

  const HomeButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isTablet = false,
    this.backgroundColor,
    this.textColor,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: isTablet ? 450 : double.infinity,
      height: isTablet ? 52 : 46,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: hasBorder
                ? const BorderSide(color: AppColors.primaryColor, width: 1.5)
                : BorderSide.none,
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textTheme.labelLarge?.copyWith(
            fontSize: isTablet ? 16 : 14,
            fontWeight: FontWeight.w600,
            color: textColor ?? AppColors.whiteColor,
          ) ?? TextStyle(
            fontSize: isTablet ? 16 : 14,
            fontWeight: FontWeight.w600,
            color: textColor ?? AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
