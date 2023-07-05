import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewNoteController extends GetxController {
  final titleTextEditingController = TextEditingController();
  final bodyTextEditingController = TextEditingController();
  // Rx<Color> saveNoteIconColor = Colors.black.obs;
  // Rx<Color> deleteNoteIconColor = Colors.black.obs;

  RxInt saveNoteIconColor = 0xFF000000.obs;
  RxInt deleteNoteIconColor = 0xFF000000.obs;
  RxDouble iconOpacity = .5.obs;

  ValueNotifier<String> noteTitle = ValueNotifier('');
  
  ValueNotifier<String> noteBody = ValueNotifier('');

  void handleChangesToTextField(String value) {
    if (titleTextEditingController.value.isBlank!) {
      saveNoteIconColor.value = 0xFF000000;
      deleteNoteIconColor.value = 0xFF000000;
      iconOpacity.value = .5;
    }

    saveNoteIconColor.value = 0xFF00FF00;
    deleteNoteIconColor.value = 0xFFFF0000;
    iconOpacity.value = 1;
  }
}
