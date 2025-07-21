import 'package:docdoc_app/features/home/ui/home_body_screen.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Widget> homeScreens = [
    const HomeBodyScreen(),
    Container(),
    Container(),
    Container(),
  ];
}
