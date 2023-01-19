import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

import '../../controller/navigation_controller.dart';

class BottomBarIcon extends StatelessWidget {
  final IconData icon;
  final NavigationController controller;
  final int index;

  const BottomBarIcon(
      {Key? key,
      required this.icon,
      required this.controller,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        controller.changeIndex(index);
      },
      icon: Icon(
        icon,
        color: controller.selectedIndex.value == index
            ? primaryColor
            : Colors.grey,
      ),
    );
  }
}
