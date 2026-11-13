import 'package:cleaning_app/Dashboard/DashboardController.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:go_router/go_router.dart';

class DashboardMainScreen extends StatefulWidget {
  final Widget child;
  const DashboardMainScreen({super.key, required this.child});

  @override
  State<DashboardMainScreen> createState() => _DashboardMainScreenState();
}

class _DashboardMainScreenState extends State<DashboardMainScreen> {

  final DashboardController controller = Get.put(DashboardController());

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.contains(Routes.homeScreen) || location.contains(Routes.dashboardScreen)) {
      return 0;
    } else if (location.contains('/booking')) {
      return 1;
    } else if (location.contains('/earnng')) {
      return 2;
    } else if (location.contains('/profile')) {
      return 3;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width >= 600;
    int currentIndex = _calculateSelectedIndex(context);

    return Scaffold(
      backgroundColor: AppColors.navbarColor,
      body: widget.child,
      bottomNavigationBar: Container(
        height: 68,
        margin: EdgeInsets.symmetric(
          horizontal: isTablet ? 80.0 : 16.0,
          vertical: 20.0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(22.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(
              context,
              index: 0,
              currentIndex: currentIndex,
              iconPath: IconString.homeScreenIcon,
              title: TextString.navHome,
              route: Routes.homeScreen,
            ),
            _buildNavItem(
              context,
              index: 1,
              currentIndex: currentIndex,
              iconPath: IconString.bookingScreenIcon,
              title: TextString.navBookings,
              route:'/booking'
            ),
            _buildNavItem(
              context,
              index: 2,
              currentIndex: currentIndex,
              iconPath: IconString.earningScreenIcon,
              title: TextString.navEarnings,
              route: '/earning'
            ),
            _buildNavItem(
              context,
              index: 3,
              currentIndex: currentIndex,
              iconPath: IconString.profileIcon,
              title: TextString.navProfile,
              route: '/profile'
            ),
          ],
        ),
      ),
    );
  }

  /// ------------- Extra Widget -------------------///
  // Nav Item Widget
  Widget _buildNavItem(
      BuildContext context, {
        required int index,
        required int currentIndex,
        required String iconPath,
        required String title,
        required String route,
      }) {
    bool isSelected = currentIndex == index;
    TextStyle labelStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor,
    ) ??
        const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: AppColors.whiteColor);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (currentIndex != index) {
          context.go(route);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: isSelected ? 14 : 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 20,
              height: 20,
              colorFilter: ColorFilter.mode(
                isSelected ? AppColors.whiteColor : AppColors.secondaryColor,
                BlendMode.srcIn,
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(title, style: labelStyle),
            ],
          ],
        ),
      ),
    );
  }
}