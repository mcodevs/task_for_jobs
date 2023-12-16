import 'package:flutter/material.dart';
import 'package:task_for_job/common/constants/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.childText,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.foregroundColor = AppColors.white,
    super.key,
  });

  final String childText;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: foregroundColor,
            minimumSize: const Size.fromHeight(60),
            maximumSize: const Size.fromHeight(60),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            childText,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
