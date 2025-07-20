import 'package:docdoc_app/core/style/colors.dart';
import 'package:flutter/material.dart';

class LoginTitleAndDesc extends StatelessWidget {
  const LoginTitleAndDesc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const Text(
          "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
          style: TextStyle(
            fontSize: 14,
            color: AppColors.textBodyColor,
          ),
        )
      ],
    );
  }
}
