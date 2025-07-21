import 'package:docdoc_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.asset(
            'assets/images/home_banner_bg.png',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 20,
          top: 10,
          child: Column(
            spacing: 30,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Book and\nschedule with\nnearest doctor',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  height: 1.8,
                ),
              ),
              Container(
                height: 50,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'Find Nearby',
                    style: TextStyle(
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          top: -50,
          right: 0,
          child: Image.asset(
            'assets/images/doctor_2.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
