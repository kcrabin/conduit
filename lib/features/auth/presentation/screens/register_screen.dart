import 'package:conduit/core/presentation/utils/spacing.dart';
import 'package:conduit/core/presentation/utils/validators.dart';
import 'package:conduit/core/presentation/widgets/custom_elevated_button.dart';
import 'package:conduit/core/presentation/widgets/custom_textbutton.dart';
import 'package:conduit/core/presentation/widgets/textfield.dart';
import 'package:conduit/features/auth/presentation/controllers/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.find<RegisterController>();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Register',
                style: Theme.of(context).textTheme.displayLarge,
              ),
             const Spacer(),
              CustomTextField(
                controller: registerController.emailController,
                labelText: 'Email',
                validator: (value) => Validators.validateEmail(value!),
              ),
              Spacing.sizeBoxH_5(),
              CustomTextField(
                lines: 1,
                controller: registerController.passwordController,
                labelText: 'Password',
                isObscure: true,
                validator: (value) => Validators.validatePassword(value!),
              ),
              Spacing.sizeBoxH_5(),
              CustomTextField(
                controller: registerController.usernameController,
                labelText: 'Username',
                validator: (value) => Validators.validateUsername(value!),
              ),
              // Spacing.sizeBoxH_15(),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButton(
                    onClicked: () {
                      Get.toNamed('/login');
                    },
                    text: 'Have an account?'),
              ),
              CustomElevtedButton(
                onClicked: () {
                  registerController.requestRegister();
                },
                minSize: Size(MediaQuery.of(context).size.width * 0.5, 44),
                name: 'Register',
              ),
             const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
