import 'package:cleaning_app/Profile/ProfileController.dart';
import 'package:cleaning_app/Profile/ReusableWidget/ProfileButton.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/TextString.dart' show TextString;
import 'package:cleaning_app/Sidebar/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  final ProfileController controller = Get.isRegistered<ProfileController>()
      ? Get.find<ProfileController>()
      : Get.put(ProfileController());

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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1. Top Header Banner
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
                                TextString.profileTitle,
                                style: textTheme.headlineLarge?.copyWith(
                                  color: AppColors.whiteColor,
                                  fontSize: isTablet ? 22 : 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                TextString.profileSubtitle,
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

                // 2. User Avatar, Name, Email & Verified Badge
                Obx(() {
                  final double avatarSize = isTablet ? 96 : 76;
                  return Column(
                    children: [
                      Container(
                        width: avatarSize,
                        height: avatarSize,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.photoBackground,
                          border: Border.all(
                            color: AppColors.whiteColor,
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blackColor.withValues(alpha: 0.08),
                              blurRadius: 10,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            controller.profileImagePath.value,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(
                                Icons.person,
                                size: isTablet ? 44 : 36,
                                color: AppColors.secondaryColor,
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        controller.userName.value,
                        style: textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 20 : 16,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        controller.userEmail.value,
                        style: textTheme.titleSmall?.copyWith(
                          fontSize: isTablet ? 14 : 12,
                          color: AppColors.secondaryColor,
                        ),
                      ),
                      if (controller.isVerifiedCleaner.value) ...[
                        const SizedBox(height: 6),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              size: isTablet ? 16 : 14,
                              color: AppColors.mainGreenColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              TextString.verifiedCleanerText,
                              style: textTheme.titleSmall?.copyWith(
                                fontSize: isTablet ? 13 : 11,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainGreenColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  );
                }),

                const SizedBox(height: 20),

                // 3. Personal Information Card
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Obx(() {
                    return _buildInfoSectionCard(
                      textTheme: textTheme,
                      heading: TextString.personalInfoHeading,
                      isTablet: isTablet,
                      rows: [
                        _InfoRowData(
                          label: TextString.fullNameLabel,
                          value: controller.fullName.value,
                        ),
                        _InfoRowData(
                          label: TextString.phoneNumberLabel,
                          value: controller.phoneNumber.value,
                        ),
                        _InfoRowData(
                          label: TextString.emailLabel,
                          value: controller.personalEmail.value,
                        ),
                        _InfoRowData(
                          label: TextString.addressLabel,
                          value: controller.address.value,
                        ),
                      ],
                    );
                  }),
                ),

                const SizedBox(height: 16),

                // 4. Service Information Card
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Obx(() {
                    return _buildInfoSectionCard(
                      textTheme: textTheme,
                      heading: TextString.serviceInfoHeading,
                      isTablet: isTablet,
                      rows: [
                        _InfoRowData(
                          label: TextString.cleaningServicesLabel,
                          value: controller.cleaningServices.value,
                        ),
                        _InfoRowData(
                          label: TextString.experienceLabel,
                          value: controller.experience.value,
                        ),
                        _InfoRowData(
                          label: TextString.serviceAreaLabel,
                          value: controller.serviceArea.value,
                        ),
                      ],
                    );
                  }),
                ),

                const SizedBox(height: 22),

                // 5. Edit Profile Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Center(
                    child:  ProfileButton(
                      text: TextString.editProfileButton,
                      onPressed: () => controller.onEditProfileTap(context),
                      isTablet: isTablet,
                      backgroundColor: AppColors.primaryColor,
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

  Widget _buildInfoSectionCard({
    required TextTheme textTheme,
    required String heading,
    required List<_InfoRowData> rows,
    required bool isTablet,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 20 : 16,
        vertical: isTablet ? 20 : 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.containerBackground,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: isTablet ? 17 : 15,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 14),
          ...List.generate(rows.length, (index) {
            final row = rows[index];
            return Padding(
              padding: EdgeInsets.only(
                bottom: index == rows.length - 1 ? 0 : 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    row.label,
                    style: textTheme.titleSmall?.copyWith(
                      fontSize: isTablet ? 14 : 12,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Flexible(
                    child: Text(
                      row.value,
                      textAlign: TextAlign.right,
                      style: textTheme.bodyMedium?.copyWith(
                        fontSize: isTablet ? 14 : 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _InfoRowData {
  final String label;
  final String value;

  const _InfoRowData({
    required this.label,
    required this.value,
  });
}