import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/Navigation%20and%20Routing/view/add_note.dart';
import 'package:getx_practice/Navigation%20and%20Routing/view/note_details.dart';

import '../controller/note_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController c = Get.put(NoteController());

    return Scaffold(
      appBar: AppBar(title: Text("My Notes")),
      body: Obx(() {
        if (c.notes.isEmpty) {
          return Center(child: Text("No Notes Inserted"));
        }
        return ListView.builder(
          itemCount: c.notes.length,
          itemBuilder: (context, index) {
            final note = c.notes[index];
            return ListTile(
              title: Text(note),
              onTap: () => Get.to(NoteDetails(), arguments: note),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(AddNote()),
        child: Icon(Icons.add),
      ),
    );
  }
}
