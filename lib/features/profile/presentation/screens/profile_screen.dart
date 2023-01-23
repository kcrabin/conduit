import 'package:conduit/core/presentation/themes/app_themes.dart';
import 'package:conduit/core/presentation/themes/colors.dart';
import 'package:conduit/core/presentation/utils/spacing.dart';
import 'package:conduit/core/presentation/widgets/custom_elevated_button.dart';
import 'package:conduit/features/profile/presentation/screens/widgets/container_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ContainerButton(
              name: 'My Articles',
              onPressed: () {},
            ),
            Spacing.sizeBoxH_10(),
            ContainerButton(
              name: 'Favorited Articles',
              onPressed: () {},
            ),
            Spacing.sizeBoxH_10(),
            ContainerButton(
              name: 'Edit Profile',
              onPressed: () {},
            ),
            Spacer(),
            CustomElevtedButton(
                onClicked: () {
                  
                },
                minSize: Size(MediaQuery.of(context).size.width * 0.8, 50),
                name: 'Log out'),
            Spacing.sizeBoxH_10()
          ],
        ),
      ),
    );
  }
}
