import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteController extends GetxController{
  var notes=<String>[].obs;

  void addNode(String note){
    notes.add(note);
  }
}