import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomElevtedButton extends StatelessWidget {
  Color? color;
  VoidCallback onClicked;
  Size minSize;
  String name;

  CustomElevtedButton(
      {super.key,
      this.color,
      required this.onClicked,
      required this.minSize,
      required this.name});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        name,
        style:  TextStyle(color: Colors.white, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          minimumSize: minSize),
      onPressed: onClicked,
    );
  }
}
