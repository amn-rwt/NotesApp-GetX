import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  Future<void> addUser(String username, String email, String uid) {
    return users.add({
      'username': username,
      'email': email,
      'uid': uid,
    });
  }

  Future<void> addNote(String uid, String title, String body) {
    return notes.add({
      'uid': uid,
      'title': title,
      'body': body,
    }).then((value) => log(value.toString()));
  }

  Future<void> deleteNote() {
    return notes.doc('').delete();
  }

  Future<void> updateNote(String uid, String title, String body) {
    return notes.doc('').set({
      'uid': uid,
      'title': title,
      'body': body,
    });
  }
}
