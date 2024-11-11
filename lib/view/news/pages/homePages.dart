import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmgetx/viewmodel/newsController/bottomnavController.dart';

import 'widgets/bottomNavBar.dart';

class Homepages extends StatefulWidget {
  const Homepages({super.key});

  @override
  State<Homepages> createState() => _HomepagesState();
}

class _HomepagesState extends State<Homepages> {
  BottomNavController bottomController = Get.put(BottomNavController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottomnavbar(),
      body:
          Obx(() => bottomController.pages[bottomController.isSelected.value]),
    );
  }
}
