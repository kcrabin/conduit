import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onClicked;
  final String text;
  const CustomTextButton({
    required this.onClicked,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onClicked,
        child: Text(
          text,
          style:const TextStyle(color: primaryColor),
        ));
  }
}
