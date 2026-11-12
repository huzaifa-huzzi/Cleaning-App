import 'package:cleaning_app/Dashboard/DashboardController.dart';
import 'package:cleaning_app/HomeScreen/HomeScreen.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/TextString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';



class DashboardMainScreen extends StatefulWidget {
  const DashboardMainScreen({super.key});

  @override
  State<DashboardMainScreen> createState() => _DashboardMainScreenState();
}

class _DashboardMainScreenState extends State<DashboardMainScreen> {
  final DashboardController controller = Get.put(DashboardController());

  // 1. Screens ki list (Har tab ki apni screen)
  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      const Center(child: Text('Bookings Screen')),
      const Center(child: Text('Earnings Screen')),
      const Center(child: Text('Profile Screen')),
    ];
  }

  // 2. Navigation Bar Items
  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    TextStyle labelStyle = Theme.of(context).textTheme.titleSmall?.copyWith(
      fontSize: 11,
      fontWeight: FontWeight.w600,
    ) ??
        const TextStyle(fontSize: 11, fontWeight: FontWeight.w600);

    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          IconString.homeScreenIcon,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        inactiveIcon: SvgPicture.asset(
          IconString.homeScreenIcon,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),
        ),
        title: TextString.navHome,
        activeColorPrimary: AppColors.primaryColor, // Pill background color
        activeColorSecondary: Colors.white,         // Selected icon & text color
        inactiveColorPrimary: AppColors.secondaryColor, // Unselected color
        textStyle: labelStyle,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          IconString.bookingScreenIcon,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        inactiveIcon: SvgPicture.asset(
          IconString.bookingScreenIcon,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),
        ),
        title: TextString.navBookings,
        activeColorPrimary: AppColors.primaryColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: AppColors.secondaryColor,
        textStyle: labelStyle,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          IconString.earningScreenIcon,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        inactiveIcon: SvgPicture.asset(
          IconString.earningScreenIcon,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),
        ),
        title: TextString.navEarnings,
        activeColorPrimary: AppColors.primaryColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: AppColors.secondaryColor,
        textStyle: labelStyle,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          IconString.profileIcon,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        inactiveIcon: SvgPicture.asset(
          IconString.profileIcon,
          width: 20,
          height: 20,
          colorFilter: const ColorFilter.mode(AppColors.secondaryColor, BlendMode.srcIn),
        ),
        title: TextString.navProfile,
        activeColorPrimary: AppColors.primaryColor,
        activeColorSecondary: Colors.white,
        inactiveColorPrimary: AppColors.secondaryColor,
        textStyle: labelStyle,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width >= 600;

    return PersistentTabView(
      context,
      controller: controller.tabController,
      screens: _buildScreens(),
      items: _navBarsItems(context),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      backgroundColor: AppColors.whiteColor,
      navBarHeight: 68,
      margin: EdgeInsets.symmetric(
        horizontal: isTablet ? 80.0 : 16.0,
        vertical: 20.0,
      ),
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(22.0),
        colorBehindNavBar: AppColors.backgroundOfScreenColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      navBarStyle: NavBarStyle.style7,
    );
  }
}