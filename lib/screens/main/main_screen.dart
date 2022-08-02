import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:techtest/controllers/home_controller.dart';
import 'package:techtest/screens/main/main_screens/home/home_screen.dart';

import '../../models/navigation_bar_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final HomePageController homeController = HomePageController();
  final PageController _pageController = PageController();

  List<Widget> pages = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: homeController.output,
      initialData: homeController.currentIndex,
      builder: (context, snapshot) {
        dynamic currentIndex = snapshot.data;
        return Scaffold(
          body: PageView(
            controller: _pageController,
            children: pages,
          ),
          bottomNavigationBar: buildBottomNavigationBar(currentIndex),
        );
      },
    );
  }

  buildBottomNavigationBar(int currentIndex) {
    return BottomNavigationBar(
      selectedFontSize: 12,
      unselectedFontSize: 10,
      currentIndex: currentIndex,
      items: bottomNavItems,
      type: BottomNavigationBarType.fixed,
    );
  }
}
