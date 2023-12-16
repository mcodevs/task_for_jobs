import 'package:flutter/material.dart';
import 'package:task_for_job/common/constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.bottomLeft,
      widthFactor: 0.5,
      heightFactor: 0.8,
      child: FloatingActionButton.extended(
        heroTag: "0",
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        label: const Text(
          "Ortga qaytish",
          style: TextStyle(fontSize: 14),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
            bottom: Radius.zero,
          ),
        ),
        onPressed: () => Navigator.pop(context),
        icon: const BackButtonIcon(),
      ),
    );
  }
}
