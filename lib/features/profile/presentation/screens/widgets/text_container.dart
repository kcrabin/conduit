import 'package:flutter/material.dart';

import '../../../../../core/presentation/themes/app_themes.dart';
import '../../../../../core/presentation/themes/colors.dart';

class TextContainer extends StatelessWidget {
  final String text;
  const TextContainer({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: grey400),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: AppThemes.textTheme.bodyText2,
      ),
    );
  }
}
