import 'package:conduit/core/presentation/widgets/custom_textbutton.dart';
import 'package:conduit/features/auth/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/presentation/utils/spacing.dart';
import '../../../../core/presentation/utils/validators.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../../core/presentation/widgets/textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<LoginController>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              Spacer(),
              CustomTextField(
                controller: loginController.emailController,
                labelText: 'Email',
                validator: (value) => Validators.validateEmail(value!),
              ),
              Spacing.sizeBoxH_5(),
              CustomTextField(
                controller: loginController.passwordController,
                labelText: 'Password',
                isObscure: true,
                validator: (value) => Validators.validatePassword(value!),
              ),
              // Spacing.sizeBoxH_15(),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                    onClicked: () {
                      Get.toNamed('/register');
                    },
                    text: 'Need an account?'),
              ),
              CustomElevtedButton(
                onClicked: () {
                  loginController.requestLogin();
                },
                minSize: Size(MediaQuery.of(context).size.width * 0.5, 44),
                name: 'Login',
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
