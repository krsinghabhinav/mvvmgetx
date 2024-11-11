import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmgetx/view/notestodo/notesController/create_controller.dart';
import 'package:mvvmgetx/view/notestodo/notes_main_screen.dart';

class CreateNotesScreen extends StatefulWidget {
  const CreateNotesScreen({super.key});

  @override
  State<CreateNotesScreen> createState() => _CreateNotesScreenState();
}

class _CreateNotesScreenState extends State<CreateNotesScreen> {
  final noteController = Get.put(CreateController());

  @override
  void dispose() {
    noteController.addnoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 248, 238, 163),
        title: const Text(
          'Create Notes',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
        ),
      ),
      body: Stack(
        children: [
          // Background image covering the entire screen
          Positioned.fill(
            child: Image.asset(
              'assets/images/p.png',
              fit: BoxFit.cover,
            ),
          ),
          // Content over the background image
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: noteController.addnoteController,
                    maxLines: null,
                    decoration: const InputDecoration(
                      labelText: 'Add Notes',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      await noteController.addDataToFirebase();
                      Get.to(NoteMainScreen());

                      noteController.addnoteController.clear();
                      Get.snackbar(
                        "Success",
                        "Note added successfully",
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: Colors.green,
                        colorText: Colors.white,
                      );
                    },
                    child: const Text('Add Notes'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
