import 'package:flutter/material.dart';

import '../../../../../core/presentation/themes/app_themes.dart';
import '../../../../../core/presentation/themes/colors.dart';

class ContainerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
 const ContainerButton({Key? key, required this.onPressed, required this.name})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: primaryColor,
      onTap: onPressed,
      child: Container(
        padding:const EdgeInsets.all(10),
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width,
        height: 50,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.3),
            blurRadius: 7,
          )
        ], borderRadius: BorderRadius.circular(10), color: whiteColor),
        child: Text(
          name,
          style: AppThemes.textTheme.headline6,
        ),
      ),
    );
  }
}
