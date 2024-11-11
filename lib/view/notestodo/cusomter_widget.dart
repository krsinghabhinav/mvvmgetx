import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notesController/create_controller.dart';

void showDeleteConfirmationDialog(String currentId, BuildContext context) {
  var notecontroll = Get.put(CreateController());
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete Note'),
        content: const Text('Are you sure you want to delete this note?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog without deleting
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              notecontroll.getdelete(currentId);
              Get.back();
              Get.snackbar(
                "Success",
                "Note Deleted successfully",
                snackPosition: SnackPosition.TOP,
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            },
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}

void showUpdatedText(
    BuildContext context, String noteId, String currentContent) {
  final TextEditingController textEditingController =
      TextEditingController(text: currentContent);
  var notecontroll = Get.put(CreateController());

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Edit Note'),
        content: TextField(
          maxLines: null,
          decoration: const InputDecoration(
            hintText: 'Enter new content',
          ),
          controller: textEditingController, // Use the controller here
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              final updatedContent =
                  textEditingController.text; // Get updated text
              if (updatedContent.isNotEmpty) {
                // Call the method to update Firestore
                await notecontroll.getUpdate(noteId, updatedContent);
                Get.back(); // Close the dialog
                Get.snackbar(
                  "Success",
                  "Note Updated successfully",
                  snackPosition: SnackPosition.TOP,
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
              } else {
                // Optionally, show an error or message if the content is empty
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Content cannot be empty!')),
                );
              }
            },
            child: const Text('Update'),
          ),
        ],
      );
    },
  );
}
