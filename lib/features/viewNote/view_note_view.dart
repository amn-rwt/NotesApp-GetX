import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_firebase/features/allNotes/all_notes_view.dart';
import 'package:notes_app_firebase/features/viewNote/view_note_controller.dart';

class ViewNote extends StatelessWidget {
  final bool isNewNote;
  final String title;
  final String body;
  final controller = Get.put(ViewNoteController());

  ViewNote(
      {Key? key,
      required this.isNewNote,
      required this.title,
      required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          (isNewNote)
              ? const SizedBox(
                  height: 0,
                  width: 0,
                )
              : IconButton(
                  onPressed: () {
                    //TODO: firebase delete note
                    Get.to(() => AllNotesView());
                  },
                  icon: Obx(
                    () => Opacity(
                      opacity: controller.iconOpacity.value,
                      child: Icon(
                        Icons.delete,
                        color: Color(controller.deleteNoteIconColor.value),
                      ),
                    ),
                  ),
                ),
          IconButton(
            onPressed: () {
              //TODO: firebase add/save note
              Get.to(() => AllNotesView());
            },
            icon: Obx(
              () => Opacity(
                opacity: controller.iconOpacity.value,
                child: Icon(
                  Icons.done,
                  color: Color(controller.saveNoteIconColor.value),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              // initialValue: (title == '') ? '' : title,
              controller: controller.titleTextEditingController,
              onChanged: controller.handleChangesToTextField,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                  hintText: 'Title',
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontSize: 20)),
            ),
            TextField(
              controller: controller.bodyTextEditingController,
              onChanged: controller.handleChangesToTextField,
              decoration: const InputDecoration(
                hintText: 'Add note here...',
                border: InputBorder.none,
              ),
            )
          ],
        ),
      ),
    );
  }
}
