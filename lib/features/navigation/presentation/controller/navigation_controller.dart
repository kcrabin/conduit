import 'package:conduit/features/home/presentation/screens/add_article_screen.dart';
import 'package:conduit/features/home/presentation/screens/home_page_screen.dart';
import 'package:conduit/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final selectedIndex = 0.obs;

  List<Widget> pages = [
    const HomePageScreen(),
    const AddArticleScreen(),
    const ProfileScreen(),
  ];

  Widget get currentPage => IndexedStack(
        index: selectedIndex.value,
        children: pages,
      );

  void changeIndex(int index) {
    selectedIndex(index);
  }
}
