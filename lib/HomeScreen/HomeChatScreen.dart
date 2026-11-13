import 'package:cleaning_app/HomeScreen/HomeController.dart';
import 'package:cleaning_app/Resources/Colors.dart';
import 'package:cleaning_app/Resources/IconString.dart' show IconString;
import 'package:cleaning_app/Resources/ImageString.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';


class HomeChatScreen extends StatefulWidget {
  const HomeChatScreen({super.key});

  @override
  State<HomeChatScreen> createState() => _HomeChatScreenState();
}

class _HomeChatScreenState extends State<HomeChatScreen> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth >= 600;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.backgroundOfScreenColor,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isTablet ? 700 : double.infinity,
          ),
          child: Column(
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
                                  'Chat with Customer',
                                  style: textTheme.headlineLarge?.copyWith(
                                    color: AppColors.whiteColor,
                                    fontSize: isTablet ? 20 : 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Discuss job details with the customer.',
                                  style: textTheme.titleSmall?.copyWith(
                                    color: AppColors.whiteColor.withOpacity(0.7),
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
                  ],
                ),
              ),

              const SizedBox(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                child: Container(
                  padding: EdgeInsets.all(isTablet ? 16 : 12),
                  decoration: BoxDecoration(
                    color: AppColors.fieldColors,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.06),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: isTablet ? 28 : 22,
                            backgroundImage:  AssetImage(ImageString.avatarIcon),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jack Milson',
                                style: textTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: isTablet ? 18 : 15,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Online',
                                style: textTheme.titleSmall?.copyWith(
                                  color: AppColors.mainGreenColor,
                                  fontSize: isTablet ? 14 : 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        Icons.phone_outlined,
                        color: AppColors.primaryColor,
                        size: isTablet ? 24 : 20,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Today',
                    style: textTheme.titleSmall?.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: isTablet ? 32 : 20),
                  child: Obx(() => ListView.builder(
                    itemCount: controller.messages.length,
                    itemBuilder: (context, index) {
                      final msg = controller.messages[index];
                      bool isMe = msg['isMe'] as bool;

                      return Align(
                        alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: EdgeInsets.all(isTablet ? 16 : 12),
                          constraints: BoxConstraints(
                            maxWidth: screenWidth * 0.75,
                          ),
                          decoration: BoxDecoration(
                            color: isMe ? AppColors.whiteColor: AppColors.chatOppositeColor,
                            border: Border.all(
                              color: AppColors.primaryColor.withOpacity(0.2),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.blackColor.withOpacity(0.04),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                msg['text'] as String,
                                style: textTheme.titleSmall?.copyWith(
                                  fontSize: isTablet ? 15 : 13,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    msg['time'] as String,
                                    style: textTheme.titleSmall?.copyWith(
                                      fontSize: 10,
                                      color: AppColors.secondaryColor,
                                    ),
                                  ),
                                  if (isMe) ...[
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.done_all,
                                      size: 14,
                                      color: AppColors.primaryColor,
                                    ),
                                  ],
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isTablet ? 32 : 20,
                  vertical: 23,
                ),
                color: AppColors.backgroundOfScreenColor,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: AppColors.primaryColor,
                        controller: controller.messageController,
                        decoration: InputDecoration(
                          hintText: 'Type Message',
                          hintStyle: textTheme.titleSmall?.copyWith(
                            color: AppColors.secondaryColor,
                            fontSize: isTablet ? 14 : 12,
                          ),
                          filled: true,
                          fillColor: AppColors.containerBackground,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: isTablet ? 14 : 12,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: AppColors.primaryColor,
                              width: 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        controller.sendMessage();
                      },
                      child: Container(
                        padding: EdgeInsets.all(isTablet ? 14 : 12),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          Icons.send_rounded,
                          color: AppColors.whiteColor,
                          size: isTablet ? 24 : 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}