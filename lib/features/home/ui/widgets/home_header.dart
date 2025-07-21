import 'package:docdoc_app/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello Omar!',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.text100Color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'How Are you Today?',
                style: TextStyle(
                  fontSize: 11,
                  color: AppColors.text80Color,
                ),
              )
            ],
          ),
        ),
        CircleAvatar(
            backgroundColor: AppColors.text30Color,
            child: SvgPicture.asset('assets/svgs/notification.svg'))
      ],
    );
  }
}
