import 'package:cleaning_app/Resources/Colors.dart';
import 'package:flutter/material.dart';

class OnboardingButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isTablet;

  const OnboardingButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.isTablet = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isTablet ? 450 : double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}