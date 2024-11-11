import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class CreateController extends GetxController {
  final addnoteController = TextEditingController();
  final firebase = FirebaseFirestore.instance;

  Future<void> addDataToFirebase() async {
    // Generate a unique ID for each note entry
    final currentId = Uuid().v4();

    await firebase.collection('notes').doc(currentId).set({
      'datetime': Timestamp.fromDate(DateTime.now()),
      'title': addnoteController.text.trim(),
      'currentId': currentId,
    });

    // Clear the text field after adding the note
    addnoteController.clear();
  }

  @override
  void onClose() {
    addnoteController.dispose();
    super.onClose();
  }

  Future<void> getdelete(String currentId) async {
    await firebase.collection('notes').doc(currentId).delete();
  }

  Future<void> getUpdate(String currentId, String newText) async {
    await firebase.collection('notes').doc(currentId).update({
      'title': newText.trim(),
    });
  }
}
