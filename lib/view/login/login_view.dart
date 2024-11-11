import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvmgetx/utils/toastmessage.dart';
import 'package:mvvmgetx/viewmodel/controller/login_controller.dart';
import 'package:mvvmgetx/viewmodel/controller/user_preference/user_prefrence_viewmodel.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final loginController = Get.put(LoginControllerVM());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Login"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginController.emailController,
                focusNode: loginController.emailFocus,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    toastMessage('Enter your Email', Colors.red);
                    return 'Enter your Email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: loginController.passController,
                focusNode: loginController.passFocus,
                decoration: const InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    toastMessage('Enter password', Colors.red);
                    return 'Enter password';
                  }
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox(height: 15),
              Obx(() {
                return loginController.islogin.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginController.getLoginVM();
                          }
                        },
                        child: const Text('Login'),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
