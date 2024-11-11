// import 'dart:io';

// import 'package:mvvmgetx/BaseUrl/base_url.dart';
// import 'package:mvvmgetx/model/login_model.dart';
// import 'package:mvvmgetx/service/network_Ser.dart';

// import '../../BaseUrl/contenturl.dart';

// class LoginRepository {
//   final NetworkServiceApi networkServiceApi = NetworkServiceApi();

//   Future<loginModel> getLogin(Object requestBody) async {
//     try {
//       dynamic response = await networkServiceApi.postApi(
//         url: '${BaseUrl.baseurl}${Contenturl.loginUrl}',
//         requestBody: requestBody,
//         isRequireAuthorization: true,
//       );
//       return loginModel.fromJson(response);
//     } catch (e) {
//       // Handle any errors here
//       throw Exception('Failed to load login data: $e');
//     }
//   }
// }
// // /////////////////////////////////////////////////////////

import 'dart:io';

import 'package:mvvmgetx/BaseUrl/base_url.dart';
import 'package:mvvmgetx/model/loginUsermodel.dart';
import 'package:mvvmgetx/model/login_model.dart';
import 'package:mvvmgetx/service/network_Ser.dart';

import '../../BaseUrl/contenturl.dart';

class LoginRepository {
  final NetworkServiceApi networkServiceApi = NetworkServiceApi();

  Future<loginUserModel> getLogin(Object requestBody) async {
    try {
      dynamic response = await networkServiceApi.postApi(
        url: '${BaseUrl.baseurl}${Contenturl.loginUrl}',
        requestBody: requestBody,
        isRequireAuthorization: true,
      );
      return loginUserModel.fromJson(response);
    } catch (e) {
      // Handle any errors here
      throw Exception('Failed to load login data: $e');
    }
  }
}
