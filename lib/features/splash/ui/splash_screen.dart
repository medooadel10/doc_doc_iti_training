import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      context.pushNamedAndRemoveAll(Routes.onBoarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            bottom: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/svgs/splash_bg.svg',
            ),
          ),
          Positioned(
            top: 0,
            left: 40,
            bottom: 0,
            right: 40,
            child: SvgPicture.asset(
              'assets/svgs/splash_logo.svg',
            ),
          ),
        ],
      ),
    );
  }
}
