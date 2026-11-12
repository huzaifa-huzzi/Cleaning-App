import 'package:cleaning_app/HomeScreen/HomeController.dart' show HomeController;
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/ImageString.dart' show ImageString;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrowseJobsScreen extends StatelessWidget {
  BrowseJobsScreen({super.key});

  final HomeController controller = Get.find<HomeController>();

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
                      height: isTablet ? 310 : 270,
                    ),

                    // Header Background Container with Image
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
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.arrow_back, color: Colors.white, size: isTablet ? 28 : 24),
                                    onPressed: () => Navigator.pop(context),
                                    padding: EdgeInsets.zero,
                                    constraints: const BoxConstraints(),
                                  ),
                                  const SizedBox(width: 12),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Available Jobs',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: isTablet ? 20 : 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        'Find your next cleaning job',
                                        style: TextStyle(
                                          color: Colors.white70,
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
                                        icon: Icon(Icons.notifications_outlined, color: Colors.white, size: isTablet ? 28 : 24),
                                        onPressed: () {},
                                      ),
                                      Positioned(
                                        right: 11,
                                        top: 11,
                                        child: Container(
                                          width: 8,
                                          height: 8,
                                          decoration: const BoxDecoration(
                                            color: Colors.red,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.menu, color: Colors.white, size: isTablet ? 28 : 24),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Stacked Online Status Card
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your availability',
                              style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontSize: isTablet ? 14 : 12,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "You're Online!",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 22 : 18,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              'New matching jobs can appear here.',
                              style: TextStyle(
                                color: AppColors.secondaryColor,
                                fontSize: isTablet ? 14 : 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Selectable Filter Chips using Controller state
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Obx(() => Row(
                    children: [
                      _buildFilterChip('All Jobs', 0, isTablet),
                      const SizedBox(width: 10),
                      _buildFilterChip('Home Cleaning', 1, isTablet),
                      const SizedBox(width: 10),
                      _buildFilterChip('Deep cleaning', 2, isTablet),
                    ],
                  )),
                ),
                const SizedBox(height: 20),

                // Jobs Header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Jobs near your service area',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isTablet ? 18 : 16,
                          color: AppColors.blackColor,
                        ),
                      ),
                      Text(
                        '3 Jobs',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: isTablet ? 14 : 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Job List Items
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: isTablet ? 32 : 20,
                        vertical: 8,
                      ),
                      padding: EdgeInsets.all(isTablet ? 20 : 16),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'FRI, 30 OCT · 10:00 AM',
                            style: TextStyle(
                              fontSize: isTablet ? 13 : 11,
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Standard Home Cleaning',
                            style: TextStyle(
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
                              Text('Parramatta, NSW', style: TextStyle(fontSize: isTablet ? 14 : 12, color: AppColors.secondaryColor)),
                              const SizedBox(width: 16),
                              Icon(Icons.access_time, size: isTablet ? 18 : 14, color: AppColors.primaryColor),
                              const SizedBox(width: 4),
                              Text('2 hours', style: TextStyle(fontSize: isTablet ? 14 : 12, color: AppColors.secondaryColor)),
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
                                    style: TextStyle(fontSize: isTablet ? 13 : 11, color: AppColors.secondaryColor),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    '\$81.00',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: isTablet ? 20 : 16, color: AppColors.blackColor),
                                  ),
                                  Text(
                                    'After 10% commission',
                                    style: TextStyle(fontSize: isTablet ? 12 : 10, color: AppColors.secondaryColor),
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
                                    'View Details',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isTablet ? 14 : 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Filter Chip Widget using controller state
  Widget _buildFilterChip(String label, int index, bool isTablet) {
    bool isSelected = controller.selectedIndex.value == index;

    return GestureDetector(
      onTap: () {
        controller.changeFilterIndex(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 20 : 16,
          vertical: isTablet ? 12 : 10,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.containerBackground,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.primaryColor,
            fontSize: isTablet ? 14 : 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}