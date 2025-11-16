import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteDetails extends StatelessWidget {
  const NoteDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final note = Get.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Note Details')),
      body: Center(
        child: Text(
          note,
          style: TextStyle(fontSize: 22),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.offAllNamed('/'), // Go back to HomePage (clear stack)
        child: Icon(Icons.home),
      ),
    );
  }
}
