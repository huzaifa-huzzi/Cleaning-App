import 'package:cleaning_app/Booking/BookingController.dart';
import 'package:cleaning_app/Resources/Colors.dart' show AppColors;
import 'package:cleaning_app/Resources/IconString.dart';
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:cleaning_app/Resources/Routes.dart';
import 'package:cleaning_app/Sidebar/Sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class BookingPaymentConfirmation extends StatelessWidget {
  BookingPaymentConfirmation({super.key});


  final BookingController controller = Get.find<BookingController>();

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
                                    "My Bookings",
                                    style: textTheme.headlineLarge?.copyWith(
                                      color: AppColors.whiteColor,
                                      fontSize: isTablet ? 22 : 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    "View and manage your cleaning jobs.",
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Payment Confirmation",
                        style: textTheme.headlineLarge?.copyWith(
                          fontSize: isTablet ? 22 : 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Confirm that you've received payment from your customer.",
                        style: textTheme.titleSmall?.copyWith(
                          fontSize: isTablet ? 14 : 12,
                          color: AppColors.secondaryColor,
                        ),
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
                        Text(
                          "Booking Id-1048",
                          style: textTheme.headlineSmall?.copyWith(
                            fontSize: isTablet ? 14 : 12,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
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
                                  "Awais Ali",
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
                                      Icons.star_border,
                                      color: AppColors.yellowColor,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '4.8 ',
                                      style: textTheme.titleSmall?.copyWith(
                                        fontSize: isTablet ? 14 : 12,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor,
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
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Your earnings after commission', style: textTheme.titleSmall?.copyWith(color: AppColors.secondaryColor, fontSize: isTablet ? 13 : 11)),
                            Text('\$81.00', style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.blackColor, fontSize: isTablet ? 13 : 11)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Platform commission (10%)', style: textTheme.titleSmall?.copyWith(color: AppColors.secondaryColor, fontSize: isTablet ? 13 : 11)),
                            Text('\$9.00', style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.blackColor, fontSize: isTablet ? 13 : 11)),
                          ],
                        ),
                        const Divider(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total Payment',
                              style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold, fontSize: isTablet ? 16 : 14),
                            ),
                            Text(
                              '\$90.00',
                              style: textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 20 : 16,
                                color: AppColors.mainGreenColor,
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
                  child: Text(
                    "Cleaning Requirements",
                    style: textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: isTablet ? 18 : 15,
                      color: AppColors.blackColor,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Obx(() => Column(
                    children: [
                      _buildPaymentOptionCard(
                        context: context,
                        index: 0,
                        svgPath: IconString.cashIcon,
                        title: "Cash",
                        subtitle: "Customer paid you directly",
                        isTablet: isTablet,
                      ),
                      const SizedBox(height: 10),
                      _buildPaymentOptionCard(
                        context: context,
                        index: 1,
                        title: "Online Payment",
                        subtitle: "Payment handled by the platform",
                        isTablet: isTablet, svgPath: IconString.onlinePayment,
                      ),
                    ],
                  )),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Container(
                    padding: EdgeInsets.all(isTablet ? 24 : 18),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.info_outline, color: AppColors.whiteColor, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              "Cash received?",
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.bold,
                                fontSize: isTablet ? 16 : 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Only confirm if the customer has paid the full \$90. Your \$9 platform commission remains a separate obligation.",
                          style: textTheme.titleSmall?.copyWith(
                            color: AppColors.whiteColor.withOpacity(0.85),
                            fontSize: isTablet ? 13 : 11,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            SizedBox(
                              height: 24,
                              width: 24,
                              child: Obx(() => Checkbox(
                                value: controller.isCashConfirmed.value,
                                onChanged: (val) => controller.toggleCashConfirmation(val),
                                activeColor: AppColors.mainGreenColor,
                                checkColor: AppColors.whiteColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                side: const BorderSide(color: AppColors.whiteColor),
                              )),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                "I confirm I received \$90.00 in cash.",
                                style: textTheme.titleSmall?.copyWith(
                                  color: AppColors.whiteColor,
                                  fontSize: isTablet ? 13 : 11,
                                  fontWeight: FontWeight.w500,
                                ),
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
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: isTablet ? 52 : 46,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () => controller.markReadyForPayment(context),
                            child: Text(
                              "Payment recieved",
                              style: textTheme.labelLarge?.copyWith(
                                color: AppColors.whiteColor,
                                fontWeight: FontWeight.w600,
                                fontSize: isTablet ? 14 : 12,
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              context.push(Routes.bookingScreen);
                            },
                            child: Text(
                              "Back to Booking",
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

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// -------------- Extra Widget --------------------- ///



   // Payment Option Card
  Widget _buildPaymentOptionCard({
    required BuildContext context,
    required int index,
    required String svgPath,
    required String title,
    required String subtitle,
    required bool isTablet,
  }) {
    final textTheme = Theme.of(context).textTheme;
    bool isSelected = controller.selectedPaymentMethod.value == index;

    return GestureDetector(
      onTap: () => controller.setPaymentMethod(index),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 20 : 16,
          vertical: isTablet ? 16 : 12,
        ),
        decoration: BoxDecoration(
          color: AppColors.containerBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.blackColor.withOpacity(0.02),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              width: isTablet ? 22 : 18,
              height: isTablet ? 22 : 18,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
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
            Radio<int>(
              value: index,
              groupValue: controller.selectedPaymentMethod.value,
              onChanged: (val) => controller.setPaymentMethod(val!),
              activeColor: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }


}