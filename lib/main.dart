import 'package:docdoc_app/core/helpers/local_storage.dart';
import 'package:docdoc_app/core/networking/dio_factory.dart';
import 'package:docdoc_app/core/router/app_router.dart';
import 'package:docdoc_app/core/router/routes.dart';
import 'package:docdoc_app/core/style/themes.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioFactory.init();
  await LocalStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.theme,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter().onGenerateRoute,
      initialRoute: Routes.splash,
    );
  }
}
