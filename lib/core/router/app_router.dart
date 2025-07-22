import 'package:docdoc_app/core/router/routes.dart';
import 'package:docdoc_app/features/create_account/logic/create_account_provider.dart';
import 'package:docdoc_app/features/create_account/ui/create_account_screen.dart';
import 'package:docdoc_app/features/doctor_details/logic/doctor_details_provider.dart';
import 'package:docdoc_app/features/doctor_details/ui/doctor_details_screen.dart';
import 'package:docdoc_app/features/doctors/ui/doctors_screen.dart';
import 'package:docdoc_app/features/home/logic/home_provider.dart';
import 'package:docdoc_app/features/home/models/doctors_response_model.dart';
import 'package:docdoc_app/features/home/ui/home_screen.dart';
import 'package:docdoc_app/features/login/logic/login_provider.dart';
import 'package:docdoc_app/features/login/ui/login_screen.dart';
import 'package:docdoc_app/features/on_boarding/ui/on_boarding_screen.dart';
import 'package:docdoc_app/features/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => LoginProvider(),
            child: const LoginScreen(),
          ),
        );
      case Routes.createAccount:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => CreateAccountProvider(),
            child: const CreateAccountScreen(),
          ),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => HomeProvider()
              ..getSpecializations()
              ..getDoctors(),
            child: const HomeScreen(),
          ),
        );

      case Routes.doctors:
        final args = settings.arguments as List<DoctorModel>;
        return MaterialPageRoute(
          builder: (context) => DoctorsScreen(doctors: args),
        );
      case Routes.doctorDetails:
        final doctor = settings.arguments as DoctorModel;
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
              create: (context) => DoctorDetailsProvider(),
              child: DoctorDetailsScreen(doctor: doctor)),
        );
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
