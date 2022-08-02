import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techtest/constant.dart';

const double iconSize = 18;

class NavigationBarItem {
  NavigationBarItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });

  String label;
  Widget icon, activeIcon;
}

List<NavigationBarItem> navItems = <NavigationBarItem>[
  NavigationBarItem(
    icon: const Icon(
      Icons.home,
      color: Colors.grey,
    ),
    activeIcon: const Icon(
      Icons.home,
      color: PrimaryColor,
    ),
    label: "Home",
  ),
  NavigationBarItem(
    icon: const Icon(
      Icons.search,
      color: Colors.grey,
    ),
    activeIcon: const Icon(
      Icons.search,
      color: PrimaryColor,
    ),
    label: "Search",
  ),
  NavigationBarItem(
    icon: const Icon(
      Icons.chat,
      color: Colors.grey,
    ),
    activeIcon: const Icon(
      Icons.chat,
      color: PrimaryColor,
    ),
    label: "Chat",
  ),
  NavigationBarItem(
    icon: const Icon(
      Icons.person,
      color: Colors.grey,
    ),
    activeIcon: const Icon(
      Icons.person,
      color: PrimaryColor,
    ),
    label: "Account",
  ),
];

List<BottomNavigationBarItem> bottomNavItems = List.generate(
  navItems.length,
  (index) {
    return BottomNavigationBarItem(
      icon: navItems[index].icon,
      activeIcon: navItems[index].activeIcon,
      label: navItems[index].label,
    );
  },
);
