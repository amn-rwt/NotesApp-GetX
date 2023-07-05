import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_firebase/features/allNotes/all_notes_view.dart';
import 'package:notes_app_firebase/features/auth/login_view.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    Widget home = LoginView();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        home = LoginView();
      } else {
        home = AllNotesView();
      }
    });
    return home;
  }
}
