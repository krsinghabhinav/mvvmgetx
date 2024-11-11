// login_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmgetx/model/loginUsermodel.dart';
import 'package:mvvmgetx/res/routes/routes_name.dart';
import 'package:mvvmgetx/utils/toastmessage.dart';
import '../../repository/login_repository/login_repositroy.dart';
import '../../response/api_response.dart';
import 'user_preference/user_prefrence_viewmodel.dart';

class LoginControllerVM extends GetxController {
  final LoginRepository loginRepository = LoginRepository();

  final emailController = TextEditingController();
  final passController = TextEditingController();
  var islogin = false.obs;

  final FocusNode emailFocus = FocusNode();
  final FocusNode passFocus = FocusNode();

  var loginListVM = ApiResponse<loginUserModel>.loading().obs;

  void setLoginListVM(ApiResponse<loginUserModel> response) {
    loginListVM.value = response;
  }

  Future<void> getLoginVM() async {
    islogin.value = true;
    setLoginListVM(ApiResponse.loading());

    Map<String, dynamic> requestBody = {
      "email": emailController.text.trim(),
      "password": passController.text.trim(),
    };

    try {
      final loginVM = await loginRepository.getLogin(requestBody);
      setLoginListVM(ApiResponse.completed(loginVM));

      // Save user data to preferences
      // userPreferenceViewModel.saveUser(loginVM).then((isSaved) {
      //   if (isSaved) {
      //     Get.toNamed(RoutesName.homeView);
      //     toastMessage('Login successful', Colors.green);
      //   } else {
      //     toastMessage('Failed to save user data', Colors.red);
      //   }
      // });

      islogin.value = false;
    } catch (e) {
      islogin.value = false;
      setLoginListVM(ApiResponse.error(e.toString()));
      toastMessage("API request failed: ${e.toString()}", Colors.red);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    emailFocus.dispose();
    passFocus.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    getLoginVM();
  }
}
