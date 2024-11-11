import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/toastmessage.dart';

class NetworkServiceApi {
  // Method to generate headers based on authorization requirement
  Map<String, String> header(bool isRequireAuthorization) {
    if (isRequireAuthorization) {
      return {
        // "Authorization": "Bearer ${StorageHelper().getToken()}",
        "Authorization": "Bearer {your access token}",
        'Content-Type': 'application/json'
      };
    } else {
      return {'Content-Type': 'application/json'};
    }
  }

  // GET API request method
  Future<dynamic> getApi({
    required String url,
    bool isRequireAuthorization = false, // Added this parameter
  }) async {
    try {
      final apiResponse = await http
          .get(Uri.parse(url), headers: header(isRequireAuthorization))
          .timeout(const Duration(seconds: 20));

      print("API GET URL: $url");
      print('API Header: ${header(isRequireAuthorization)}');
      print("API Response: ${apiResponse.body}");

      return returnResponse(apiResponse);
    } on SocketException {
      print("No Internet connection");
      toastMessage("No Internet connection", Colors.red);
      return null;
    } catch (e) {
      print("Error occurred: $e");
      toastMessage("An error occurred: $e", Colors.red);
      return null;
    }
  }

  // POST API request method
  Future<dynamic> postApi({
    required String url,
    Object? requestBody,
    bool isRequireAuthorization = false,
  }) async {
    try {
      print("API POST URL: $url");

      // Sending the POST request
      http.Response apiResponse = await http.post(Uri.parse(url),
          body: requestBody != null ? jsonEncode(requestBody) : null,
          headers: header(isRequireAuthorization));

      // Print the request body if it exists
      if (requestBody != null) {
        print("API Request Body: $requestBody");
      }
      print("API GET URL: $url");
      print('API Header: ${header(isRequireAuthorization)}');
      print("API Response: ${apiResponse.body}");
      return returnResponse(apiResponse);
    } on SocketException {
      print("No Internet connection");
      toastMessage("No Internet connection", Colors.red);
      return null;
    } catch (e) {
      print("Error occurred: $e");
      toastMessage("An error occurred: $e", Colors.red);
      return null;
    }
  }

  // Private method to handle and process API responses
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);

      case 400:
        var decodeError = jsonDecode(response.body);
        if (decodeError.containsKey('error')) {
          toastMessage(decodeError['error'].toString(), Colors.red);
        }
        throw Exception('API Error: Status Code 400');

      case 401:
        toastMessage("Unauthorized access: Status Code 401", Colors.red);
        throw Exception("Unauthorized access: Status Code 401");

      case 500:
        toastMessage("Server error: Status Code 500", Colors.red);
        throw Exception("Server error: Status Code 500");

      default:
        toastMessage("Error: Status Code ${response.statusCode}", Colors.red);
        throw Exception("Unexpected error: Status Code ${response.statusCode}");
    }
  }
}
