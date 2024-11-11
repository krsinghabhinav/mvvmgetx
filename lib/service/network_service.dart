// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import '../utils/toastmessage.dart';

// class NetworkServiceApi {
//   // Method to generate headers based on authorization requirement
//   Map<String, String> header(bool isRequireAuthorization) {
//     if (isRequireAuthorization) {
//       return {
//         // "Authorization": "Bearer ${StorageHelper().getToken()}",
//         "Authorization": "Bearer {your access token}",
//         'Content-Type': 'application/json'
//       };
//     } else {
//       return {'Content-Type': 'application/json'};
//     }
//   }

//   // GET API request method
//   Future<dynamic> getApi({
//     required String url,
//     bool isRequireAuthorization = false,
//   }) async {
//     try {
//       final apiResponse = await http
//           .get(Uri.parse(url), headers: header(isRequireAuthorization))
//           .timeout(Duration(seconds: 20));
//       print("API GET URL: $url");
//       print('API Header: ${header(isRequireAuthorization)}');
//       print("API Response: ${apiResponse.body}");
//       return returnResponse(apiResponse);
//     } on SocketException {
//       print("No Internet connection");
//       toastMessage("No Internet connection", Colors.red);
//       return null;
//     } catch (e) {
//       print("Error occurred: $e");
//       toastMessage("An error occurred: $e", Colors.red);
//       return null;
//     }
//   }

//   // Future<dynamic> getApiM2({
//   //   required String url,
//   //   required String jwtToken,
//   // }) async {
//   //   try {
//   //     // Making the GET request with JWT in the header
//   //     final apiResponse = await http.get(
//   //       Uri.parse(url),
//   //       headers: {
//   //         'Content-Type': 'application/json',
//   //         // 'Authorization': 'Bearer $jwtToken',
//   //         // "Authorization": "Bearer {your access token}",
//   //       },
//   //     );

//   //     // Logging for debugging purposes
//   //     print("API Get URL: $url");
//   //     print("API Header (JWT): $jwtToken");
//   //     print("API Response: ${apiResponse.body}");

//   //     // Handle and return the response
//   //     return returnResponse(apiResponse);
//   //   } on SocketException {
//   //     print("No Internet connection");
//   //     return null; // Handle this case as needed in your app
//   //   } catch (e) {
//   //     print("Error occurred: $e");
//   //     return null; // Handle any other exceptions
//   //   }
//   // }
// }

// // Private method to handle and process API responses
// dynamic returnResponse(http.Response response) {
//   switch (response.statusCode) {
//     case 200:
//     case 201:
//       var responseJson = jsonDecode(response.body);
//       return responseJson;

//     case 400:
//       var decodeError = jsonDecode(response.body);
//       if (decodeError.containsKey('error')) {
//         toastMessage(decodeError['error'].toString(), Colors.red);
//       }
//       throw Exception('API Error: Status Code 400');

//     case 401:
//       toastMessage("Unauthorized access: Status Code 401", Colors.red);
//       throw Exception("Unauthorized access: Status Code 401");

//     case 500:
//       toastMessage("Server error: Status Code 500", Colors.red);
//       throw Exception("Server error: Status Code 500");

//     default:
//       toastMessage("Error: Status Code ${response.statusCode}", Colors.red);
//       throw Exception("Unexpected error: Status Code ${response.statusCode}");
//   }
// }
