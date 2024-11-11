import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'animatedcontainer.dart';

class AnimationHomePage extends StatefulWidget {
  const AnimationHomePage({super.key});

  @override
  State<AnimationHomePage> createState() => _AnimationHomePageState();
}

class _AnimationHomePageState extends State<AnimationHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text("Flutter Animation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Card(
              color: const Color.fromARGB(255, 255, 7, 69),
              child: ListTile(
                onTap: () {
                  Get.to(Animatedcontainer());
                },
                leading: Icon(Icons.add_box),
                title: Text("Animation Container"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
