import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_firebase/features/auth/login_view.dart';

class AllNotesController extends GetxController {
  Future<Future> showAlertDialog(BuildContext context) async {
    log('here');
    return showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
                'Logout from *userAccount'), //TODO: change *userAccount to username
            actions: [
              IconButton(
                  onPressed: () => logOut(), icon: const Icon(Icons.logout))
            ],
          );
        });
  }

  Future<void> logOut() async {
    log('here');
    Get.off(() => LoginView());
    //TODO: firebase logout()
  }
}
