import 'package:docdoc_app/core/style/colors.dart';
import 'package:flutter/material.dart';

class CustomAuthTitleDesc extends StatelessWidget {
  final String title;
  final String description;
  const CustomAuthTitleDesc(
      {Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(
          description,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textBodyColor,
          ),
        )
      ],
    );
  }
}
