import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:conduit/features/navigation/presentation/controller/navigation_controller.dart';
import 'package:conduit/features/navigation/presentation/screens/widgets/bottom_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.find<NavigationController>();
    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BottomBarIcon(
                icon: Icons.home,
                controller: navigationController,
                index: 0,
              ),
              MaterialButton(
                elevation: 0,
                minWidth: 10,
                padding: const EdgeInsets.all(16),
                onPressed: () {
                  navigationController.changeIndex(1);
                },
                child: const Text(
                  "Add",
                  style: TextStyle(
                      color: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                color: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              BottomBarIcon(
                  icon: Icons.person,
                  controller: navigationController,
                  index: 2)
            ],
          ),
        ),
        body: navigationController.currentPage,
      ),
    );
  }
}
