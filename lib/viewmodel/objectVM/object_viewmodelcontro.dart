import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmgetx/model/objectmodel.dart';
import 'package:mvvmgetx/repository/login_repository/objectRepo/object_repo.dart';
import 'package:mvvmgetx/response/api_response.dart';
import 'package:mvvmgetx/utils/toastmessage.dart';

class ObjectcontrollerVM extends GetxController {
  ObjectRepo objectRepo = ObjectRepo();
  RxBool isloading = false.obs;
  final objectLidtVM = ApiResponse<objectModel>.loading().obs;

  setObjectListVM(ApiResponse<objectModel> response) {
    objectLidtVM.value = response;
  }

  Future<void> getObject() async {
    isloading.value = true;
    try {
      final response = await objectRepo.getObjetRepo();
      setObjectListVM(ApiResponse.completed(response));
      isloading.value = false;
      toastMessage('Successfully Loaded', Colors.green);
    } catch (e) {
      isloading.value = false;
      toastMessage('failed Loaded $e', Colors.red);
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getObject();
  }
}
