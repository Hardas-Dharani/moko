import 'package:flutter/material.dart';
import 'package:moko/app/config/app_colors.dart';

class AcceptTermsAndPrivacyText extends StatelessWidget {
  final bool isChecked;
  final Function(bool?)? onChanged;
  final VoidCallback onTermsPressed;
  final VoidCallback onPrivacyPressed;

  AcceptTermsAndPrivacyText({
    this.isChecked = false,
    this.onChanged,
    required this.onTermsPressed,
    required this.onPrivacyPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              fillColor: MaterialStatePropertyAll(AppColors.pinkColor),
              checkColor: AppColors.white,
              value: isChecked,
              onChanged: onChanged,
            ),
            Text(
              'By Signing in you accept ',
              style: TextStyle(color: AppColors.white),
            ),
            buildLinkText('Terms', onTermsPressed),
            Text(
              ' & ',
              style: TextStyle(color: AppColors.white),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildLinkText('Privacy Policy', onPrivacyPressed),
          ],
        ),
      ],
    );
  }

  Widget buildLinkText(String text, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.blue,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
