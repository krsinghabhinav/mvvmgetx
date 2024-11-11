import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmgetx/viewmodel/objectVM/object_viewmodelcontro.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final objectController = Get.put(ObjectcontrollerVM());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (objectController.objectLidtVM.value.data == null ||
            objectController.objectLidtVM.value.data!.data == null) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: objectController.objectLidtVM.value.data!.data!.length,
          itemBuilder: (context, index) {
            final data = objectController.objectLidtVM.value.data!.data![index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data.firstName.toString()),
                  Text(data.email.toString()),
                  Text(data.lastName.toString()),
                  Image.network(data.avatar.toString())
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
