import 'package:docdoc_app/features/home/logic/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();
    return Consumer<HomeProvider>(
      builder: (context, value, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(CupertinoIcons.search),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.chat,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_month,
                ),
                label: 'Appointments',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                label: 'Profile',
              )
            ],
            onTap: (value) {
              provider.changeIndex(value);
            },
            currentIndex: provider.currentIndex,
          ),
          body: SafeArea(child: provider.homeScreens[provider.currentIndex]),
        );
      },
    );
  }
}
