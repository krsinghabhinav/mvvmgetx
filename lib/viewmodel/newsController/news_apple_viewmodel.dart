import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmgetx/model/newsApple_model.dart';
import 'package:mvvmgetx/model/news_topheadlineModel.dart';
import 'package:mvvmgetx/repository/news_apple_Repo.dart';
import 'package:mvvmgetx/repository/news_tophadline_repo.dart';
import '../../response/api_response.dart';
import '../../utils/toastmessage.dart';

class NewAppleVMController extends GetxController {
  NewsAppleRepo newsAppleRepo = NewsAppleRepo();
  RxBool isloading = false.obs;
  final newsAppleVM = ApiResponse<newsAppleModel>.loading().obs;

  setAppleListVM(ApiResponse<newsAppleModel> response) {
    newsAppleVM.value = response;
  }

  Future<void> getNewsApple() async {
    isloading.value = true;
    try {
      final response = await newsAppleRepo.getNewsAppleRepo();
      setAppleListVM(ApiResponse.completed(response));
      isloading.value = false;
      toastMessage('Successfully Loaded', Colors.green);
    } catch (e) {
      setAppleListVM(ApiResponse.error("Api not loded $e"));

      isloading.value = false;
      toastMessage('failed Loaded $e', Colors.red);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getNewsApple();
  }
}
