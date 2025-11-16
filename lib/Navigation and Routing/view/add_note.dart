import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/Navigation%20and%20Routing/controller/note_controller.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController c = Get.find<NoteController>();
    //final NoteController c = Get.put(NoteController());
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Add Notes")),
      body: Column(
        children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(labelText: 'Enter note'),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              c.addNode(textController.text);
              Get.back();
            },
            child: Text("Save Notes"),
          ),
        ],
      ),
    );
  }
}
