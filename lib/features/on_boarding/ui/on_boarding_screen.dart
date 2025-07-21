import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:docdoc_app/core/router/routes.dart';
import 'package:docdoc_app/core/style/colors.dart';
import 'package:docdoc_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            spacing: 25,
            children: [
              SvgPicture.asset(
                'assets/svgs/splash_logo.svg',
                width: 160,
              ),
              Expanded(
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/splash_bg.svg',
                    ),
                    Container(
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white.withValues(alpha: 0.0),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: const [0.14, 0.4],
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/doctor.png',
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 55,
                      child: Text(
                        'Best Doctor\nAppointment App',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ),
              Column(
                spacing: 16,
                children: [
                  const Text(
                    'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                    style: TextStyle(
                      color: AppColors.textBodyColor,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  CustomButton(
                    onPressed: () {
                      context.pushNamed(Routes.login);
                    },
                    text: 'Get Started',
                  ),
                ],
              ).paddingSymmetric(horizontal: 16),
            ],
          ).paddingSymmetric(vertical: 16),
        ),
      ),
    );
  }
}
