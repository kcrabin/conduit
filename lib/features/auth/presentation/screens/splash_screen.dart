import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:conduit/core/presentation/utils/spacing.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Conduit",
              style: AppThemes.textTheme.headline1,
            ),
            Spacing.sizeBoxH_10(),
            Lottie.asset('assets/lottie/splash_screen.json'),
          ],
        ),
      ),
    );
  }
}
