import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_firebase/features/auth/auth_controller.dart';
import 'package:notes_app_firebase/features/auth/login_view.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 400),
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(hintText: 'email'),
            ),
            Obx(
              () => TextField(
                controller: controller.passwordController,
                obscureText: controller.isPasswordTextObsecure.value,
                decoration: InputDecoration(
                  hintText: 'password',
                  suffixIcon: IconButton(
                    onPressed: () => controller.showPassword(),
                    icon: controller.passwordSuffixIcon,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () async {
                  await controller.registerUser();
                  Get.snackbar('UserCreated',
                      'User created with ${controller.emailController.text}');
                },
                child: const Text('REGISTER',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold))),
            const SizedBox(height: 10),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'Already a user?  ',
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => LoginView()),
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
