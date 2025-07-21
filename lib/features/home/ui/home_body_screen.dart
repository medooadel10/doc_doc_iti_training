import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/features/home/ui/widgets/home_banner.dart';
import 'package:docdoc_app/features/home/ui/widgets/home_header.dart';
import 'package:flutter/material.dart';

class HomeBodyScreen extends StatelessWidget {
  const HomeBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 30,
      children: [
        HomeHeader(),
        HomeBanner(),
      ],
    ).paddingSymmetric(vertical: 10, horizontal: 14);
  }
}
