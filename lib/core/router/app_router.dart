import 'package:docdoc_app/core/router/routes.dart';
import 'package:docdoc_app/features/create_account/logic/create_account_provider.dart';
import 'package:docdoc_app/features/create_account/ui/create_account_screen.dart';
import 'package:docdoc_app/features/home/logic/home_provider.dart';
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
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
