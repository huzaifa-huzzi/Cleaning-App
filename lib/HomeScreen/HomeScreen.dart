import 'package:cleaning_app/HomeScreen/HomeController.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth >= 600;

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
                      height: isTablet ? 330 : 290,
                    ),
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Good Morning',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: isTablet ? 15 : 13,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: isTablet ? 20 : 16,
                                        backgroundImage: AssetImage(ImageString.avatarIcon),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        'Awais Ali',
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: isTablet ? 22 : 18,
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
                                          decoration: BoxDecoration(
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
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              SvgPicture.asset(
                                IconString.verifiedIcon,
                                width: isTablet ? 28 : 24,
                                height: isTablet ? 28 : 24,
                                colorFilter: ColorFilter.mode(
                                  AppColors.smallNumberGreener,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                'Verified Cleaner',
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: AppColors.smallNumberGreener,
                                  fontWeight: FontWeight.w500,
                                  fontSize: isTablet ? 14 : 12,
                                ),
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
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Obx(() => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your availability',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.secondaryColor,
                                fontSize: isTablet ? 14 : 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              controller.isOnline.value ? "You're Online!" : "You're Offline",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: controller.isOnline.value ? AppColors.mainGreenColor : AppColors.redColor,
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 22 : 18,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              controller.isOnline.value
                                  ? "You're now available for matching cleaning jobs."
                                  : "Go online when you're ready to find work.",
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: AppColors.secondaryColor,
                                fontSize: isTablet ? 14 : 12,
                              ),
                            ),
                            const SizedBox(height: 20),
                            GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                if (!controller.isOnline.value) {
                                  controller.toggleAvailability();
                                } else {
                                  context.push(Routes.BrowseJobScreen);
                                }
                              },
                              child: Container(
                                width: isTablet ? 450 : double.infinity,
                                height: isTablet ? 56 : 52,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  controller.isOnline.value ? 'Browse Available Jobs' : 'Go Online',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontSize: isTablet ? 18 : 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.whiteColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: isTablet ? 110 : 90),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Your Overview',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: isTablet ? 18 : 16,
                            ),
                          ),
                          Text(
                            'This Month',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: isTablet ? 14 : 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _buildOverviewCard(
                              context,
                              icon: Icons.check_circle_outline,
                              iconColor: AppColors.primaryColor,
                              title: 'Jobs Completed',
                              value: '24',
                              subtitle: 'This month',
                              isTablet: isTablet,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildOverviewCard(
                              context,
                              icon: Icons.account_balance_wallet_outlined,
                              iconColor: AppColors.mainGreenColor,
                              title: 'Net Earnings',
                              value: '\$1,240',
                              subtitle: 'After 10% commission',
                              isTablet: isTablet,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _buildOverviewCard(
                              context,
                              icon: Icons.access_time,
                              iconColor: AppColors.yellowColor,
                              title: 'Hours Worked',
                              value: '86h',
                              subtitle: 'Total working hours',
                              isTablet: isTablet,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildOverviewCard(
                              context,
                              icon: Icons.star_border,
                              iconColor: AppColors.purpleColor,
                              title: 'Rating',
                              value: '4.8',
                              subtitle: 'Based on 18 reviews',
                              isTablet: isTablet,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Recently Completed',
                        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          fontSize: isTablet ? 20 : 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.all(isTablet ? 20 : 16),
                        decoration: BoxDecoration(
                          color: AppColors.containerBackground,
                          borderRadius: BorderRadius.circular(16),

                          border: Border.all(
                            color: AppColors.whiteColor.withOpacity(0.15),
                            width: 1.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.blackColor.withOpacity(0.06),
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
                                  'FRI, 30 OCT · 10:00 AM',
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                    fontSize: isTablet ? 13 : 11,
                                    color: AppColors.secondaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: AppColors.mainGreenColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    'Completed',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: isTablet ? 16 : 13,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Standard Home Cleaning',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 18 : 15,
                                color: AppColors.blackColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(Icons.location_on_outlined, size: isTablet ? 18 : 14, color: AppColors.primaryColor),
                                const SizedBox(width: 4),
                                Text(
                                  'Parramatta, NSW',
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: isTablet ? 14 : 12,
                                    color: AppColors.secondaryColor,
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Icon(Icons.access_time, size: isTablet ? 18 : 14, color: AppColors.primaryColor),
                                const SizedBox(width: 4),
                                Text(
                                  '2 hours',
                                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
                                      'Expected Earnings',
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                        fontSize: isTablet ? 13 : 11,
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '\$81.00',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: isTablet ? 20 : 16,
                                        color: AppColors.blackColor,
                                      ),
                                    ),
                                    Text(
                                      'After 10% commission',
                                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
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
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'View Booking',
                                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
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

   /// -------------- Extra Widget ----------------- ///

   // OverView Card
  Widget _buildOverviewCard(
      BuildContext context, {
        required IconData icon,
        required Color iconColor,
        required String title,
        required String value,
        required String subtitle,
        required bool isTablet,
      }) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 18 : 14),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: isTablet ? 24 : 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: isTablet ? 13 : 11,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: isTablet ? 12 : 10),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: isTablet ? 22 : 18,
              fontWeight: FontWeight.bold,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: isTablet ? 12 : 10,
              color: AppColors.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}