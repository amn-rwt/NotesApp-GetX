import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    userId = null;
    log('exit called');
    super.onClose();
  }

  RxBool isPasswordTextObsecure = true.obs;
  Icon passwordSuffixIcon = const Icon(Icons.visibility);

  void showPassword() {
    isPasswordTextObsecure.value = !isPasswordTextObsecure.value;
    passwordSuffixIcon = const Icon(Icons.visibility_off);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? userId;

  GoogleSignIn googleSignIn = GoogleSignIn();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future registerUser() async {
    await auth
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) => userId = value.user!.uid);

    //TODO: save the userId along with userInfo in firestore
  }

  Future loginUser() async {
    await auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) => userId = value.user!.uid);
  }

  Future loginWithGoogle() async {
    await googleSignIn.signIn();
  }
}
