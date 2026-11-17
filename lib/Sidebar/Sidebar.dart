import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart' show IconString;
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:go_router/go_router.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth >= 600;

    return Drawer(
      backgroundColor: AppColors.backgroundOfScreenColor,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: isTablet ? 28 : 20,
            vertical: isTablet ? 24 : 18,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.whiteColor,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 18 : 14,
                      vertical: isTablet ? 10 : 8,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                  label: Text(
                    TextString.backButton,
                    style: textTheme.labelLarge?.copyWith(
                      color: AppColors.whiteColor,
                      fontSize: isTablet ? 14 : 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: isTablet ? 45 : 36,
                      backgroundImage: AssetImage(ImageString.avatarIcon),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      TextString.userName,
                      style: textTheme.headlineLarge?.copyWith(
                        color: AppColors.blackColor,
                        fontSize: isTablet ? 22 : 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      TextString.email,
                      style: textTheme.titleSmall?.copyWith(
                        color: AppColors.secondaryColor,
                        fontSize: isTablet ? 14 : 12,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Text(
                TextString.menuCategory,
                style: textTheme.titleSmall?.copyWith(
                  color: AppColors.secondaryColor,
                  fontSize: isTablet ? 14 : 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              _buildSidebarItem(
                context,
                svgPath: IconString.homeScreenIcon,
                title: TextString.menuHome,
                onTap: () {
                  Navigator.pop(context);
                  context.go(Routes.homeScreen);
                },
              ),
              _buildSidebarItem(
                context,
                svgPath: IconString.bookingScreenIcon,
                title: TextString.menuBookings,
                onTap: () {
                  Navigator.pop(context);
                  context.go(Routes.bookingScreen);
                },
              ),
              _buildSidebarItem(
                context,
                svgPath: IconString.earningScreenIcon,
                title: TextString.menuEarning,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 20),
              Text(
                TextString.accountCategory,
                style: textTheme.titleSmall?.copyWith(
                  color: AppColors.secondaryColor,
                  fontSize: isTablet ? 14 : 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              _buildSidebarItem(
                context,
                svgPath: IconString.profileIcon,
                title: TextString.menuMyProfile,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              _buildSidebarItem(
                context,
                icon: Icons.verified_outlined,
                title: TextString.menuVerification,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              _buildSidebarItem(
                context,
                svgPath: IconString.tutorialIcon,
                title: TextString.menuTutorial,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              _buildSidebarItem(
                context,
                svgPath: IconString.settingIcon,
                title: TextString.menuSettings,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              _buildSidebarItem(
                context,
                svgPath: IconString.helpIcon,
                title: TextString.menuHelpSupport,
                onTap: () {
                  Navigator.pop(context);
                },
              ),

              const SizedBox(height: 12),
              const Divider(),
              const SizedBox(height: 12),
              _buildSidebarItem(
                context,
                icon: Icons.logout_rounded,
                title: TextString.menuLogout,
                textColor: AppColors.redColor,
                iconColor: AppColors.redColor,
                onTap: () {
                  Navigator.pop(context);

                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
   /// ------------ Extra Widget ------------------ ///

  // Reusable List Tile
  Widget _buildSidebarItem(
      BuildContext context, {
        String? svgPath,
        IconData? icon,
        required String title,
        required VoidCallback onTap,
        Color? textColor,
        Color? iconColor,
        double iconSize = 22,
      }) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        child: Row(
          children: [
            svgPath != null
                ? SvgPicture.asset(
              svgPath,
              width: iconSize,
              height: iconSize,
              colorFilter: ColorFilter.mode(
                iconColor ?? AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            )
                : Icon(
              icon ?? Icons.help_outline,
              color: iconColor ?? AppColors.primaryColor,
              size: iconSize,
            ),
            const SizedBox(width: 14),
            Text(
              title,
              style: textTheme.bodyMedium?.copyWith(
                color: textColor ?? AppColors.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}