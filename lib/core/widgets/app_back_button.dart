import 'package:flutter/material.dart';
import 'package:pikachi_dobre/core/utils/constants/app_colors.dart';
import 'package:pikachi_dobre/core/utils/constants/app_strings.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        iconSize: 50,
        color: AppColors.primary,
        onPressed: () => Navigator.pop(context),
        icon: Row(
          children: [
            Icon(Icons.chevron_left),
            Text(
              AppStrings.backButton,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}