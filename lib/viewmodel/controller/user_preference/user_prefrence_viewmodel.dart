// user_preference_viewmodel.dart
import 'package:mvvmgetx/model/loginUsermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference {
  Future<bool> saveUser(loginUserModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.setString('token', responseModel.token ?? '');
    return true;
  }

  Future<loginUserModel?> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    return loginUserModel(token: token);
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.clear();
    return true;
  }
}
