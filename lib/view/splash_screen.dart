import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmgetx/viewmodel/controller/user_preference/user_prefrence_viewmodel.dart';

import '../viewmodel/controller/login_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var loginContro = Get.put(LoginControllerVM());
  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginContro.getLoginVM();
    userPreference.removeUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 141, 111),
      body: Center(
        child: Text(
          'Welcome Back',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
