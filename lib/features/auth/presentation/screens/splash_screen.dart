import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Conduit",
          style: AppThemes.textTheme.headline1,
        ),
      ),
    );
  }
}
