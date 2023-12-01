import 'package:flutter/material.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/pages/constants/app_colors.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/pages/constants/app_text_styles.dart';

class BmiContainer extends StatelessWidget {
  const BmiContainer({
    super.key,
    this.icon,
    this.text,
    this.onTap,
    required this.isFemale,
  });
  final IconData? icon;
  final String? text;

  final Function()? onTap;
  final bool isFemale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 177,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isFemale ? AppColors.whith : AppColors.gray,
              size: 70,
            ),
            Text(
              text ?? '',
              style: AppTextStyles.maleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
