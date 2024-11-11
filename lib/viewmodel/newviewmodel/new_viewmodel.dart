import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmgetx/model/news_topheadlineModel.dart';
import 'package:mvvmgetx/repository/news_tophadline_repo.dart';
import '../../response/api_response.dart';
import '../../utils/toastmessage.dart';

class NewViewmodelController extends GetxController {
  NewsTophadlineRepo newsTopRepo = NewsTophadlineRepo();
  RxBool isloading = false.obs;
  final newsTopLidtVM = ApiResponse<TopHeadlineModel>.loading().obs;

  setNewTopListVM(ApiResponse<TopHeadlineModel> response) {
    newsTopLidtVM.value = response;
  }

  Future<void> getObject() async {
    isloading.value = true;
    try {
      final response = await newsTopRepo.getNewsTopRepo();
      setNewTopListVM(ApiResponse.completed(response));
      isloading.value = false;
      toastMessage('Successfully Loaded', Colors.green);
    } catch (e) {
      isloading.value = false;
      toastMessage('failed Loaded $e', Colors.red);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getObject();
  }
}
