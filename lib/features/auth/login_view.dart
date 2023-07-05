import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_firebase/features/allNotes/all_notes_view.dart';
import 'package:notes_app_firebase/features/auth/auth_controller.dart';
import 'package:notes_app_firebase/features/auth/register_view.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(
                height: 400,
                child: Image.asset(
                  'lib/assets/app_logo.png',
                ),
              ),
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
                    suffix: IconButton(
                      onPressed: () => controller.showPassword(),
                      icon: controller.passwordSuffixIcon,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () => controller
                      .loginUser()
                      .then((value) => Get.off(() => AllNotesView())),
                  child: const Text('LOGIN',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {
                    controller.googleSignIn;
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon(Icons.google)
                      Image.asset(
                        'lib/assets/google_icon.png',
                        scale: 1.5,
                      ),
                      const SizedBox(width: 8),
                      const Text('LOGIN WITH GOOGLE',
                          style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: 'Not a user?  ',
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.to(() => RegisterView()),
                      text: 'Register',
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
