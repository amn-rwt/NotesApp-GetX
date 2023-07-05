import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes_app_firebase/constants/color_constants.dart';
import 'package:notes_app_firebase/features/allNotes/all_notes_controller.dart';
import 'package:notes_app_firebase/features/auth/auth_controller.dart';
import 'package:notes_app_firebase/features/viewNote/view_note_view.dart';
import 'package:notes_app_firebase/widgets/note_tile.dart';

class AllNotesView extends StatelessWidget {
  AllNotesView({Key? key}) : super(key: key);

  final controller = Get.put(AllNotesController());
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () => controller.showAlertDialog(context),
            child: const CircleAvatar(
              radius: 20,
            ),
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primary,
        onPressed: () => Get.to(() => ViewNote(
              title: '',
              body: '',
              isNewNote: true,
            )),
        child: const Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'ALL NOTES ${authController.userId}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Get.to(() => ViewNote(
                          isNewNote: false,
                          title: 'Exercition',
                          body:
                              'Exercitation ad ullamco veniam ex ad consequat consectetur elit esse voluptate aute quis.')),
                      child: const NoteTile(
                        title: 'Exercitation',
                        body:
                            'Exercitation ad ullamco veniam ex ad consequat consectetur elit esse voluptate aute quis.',
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
