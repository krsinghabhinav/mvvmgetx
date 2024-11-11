import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../viewmodel/newsController/bottomnavController.dart';

class Bottomnavbar extends StatefulWidget {
  const Bottomnavbar({super.key});

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 32, 31, 31),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => IconButton(
                color: controller.isSelected == 0 ? Colors.white : Colors.grey,
                onPressed: () {
                  // controller.updateSelected(0);
                  controller.isSelected.value = 0;
                },
                icon: Icon(
                  Icons.home,
                  size: 32,
                ),
              ),
            ),
            Obx(
              () => IconButton(
                color: controller.isSelected == 1 ? Colors.white : Colors.grey,
                onPressed: () {
                  // controller.updateSelected(1);
                  controller.isSelected.value = 1;
                },
                icon: Icon(
                  Icons.book,
                  size: 32,
                ),
              ),
            ),
            Obx(
              () => IconButton(
                color: controller.isSelected == 2 ? Colors.white : Colors.grey,
                onPressed: () {
                  // controller.updateSelected(2);
                  controller.isSelected.value = 2;
                },
                icon: Icon(
                  Icons.settings,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
