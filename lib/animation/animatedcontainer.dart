import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Animatedcontainer extends StatefulWidget {
  const Animatedcontainer({super.key});

  @override
  State<Animatedcontainer> createState() => _AnimatedcontainerState();
}

class _AnimatedcontainerState extends State<Animatedcontainer> {
  RxDouble size = 250.0.obs;
  Rx<Color> color = Colors.white.obs;
  RxDouble radius = 30.0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        title: Text("Animation Container"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Obx(
            () => Center(
              child: AnimatedContainer(
                height: size.value,
                width: size.value,
                decoration: BoxDecoration(
                    color: color.value,
                    borderRadius: BorderRadius.circular(radius.value)),
                duration: Duration(seconds: 2),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      if (size.value == 250 &&
                          color.value == Colors.white &&
                          radius.value == 30.0) {
                        color.value = Colors.amber;
                        size.value = 50;
                        radius.value = 0.0;
                      } else {
                        color.value = Colors.white;
                        size.value = 250;
                        radius.value = 30.0;
                      }

                      // size.value = 100.0;
                    },
                    child: Text("Size")),
                ElevatedButton(
                    onPressed: () {
                      if (color.value == Colors.white) {
                        color.value = Colors.red;
                      } else {
                        color.value = Colors.white;
                      }
                    },
                    child: Text("color")),
                ElevatedButton(
                    onPressed: () {
                      if (radius.value == 30.0) {
                        radius.value = 0.0;
                      } else {
                        radius.value = 30.0;
                      }
                    },
                    child: Text("radius")),
                ElevatedButton(onPressed: () {}, child: Text("Size")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
