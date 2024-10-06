import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/Controllers/LoginControllers.dart';
import '../Utils/EndPointApi.dart';
import '../bottomnavigbar.dart';

class RatingController extends GetxController {
  int? propertyIdController;
  int? ratingController;


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  LoginController loginController = Get.put(LoginController());

  Future<void> Rating() async {
    try {
      // Set headers with content type and authorization token
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${loginController.token}',

      };


      // Construct URL for the API endpoint
      Uri urlIntegration = Uri.parse('https://semsark.xyz/api/storerating');


      // Create the body of the request
      Map body = {
        'rating': ratingController,
        'property_id': propertyIdController};


      // Make the HTTP POST request
      http.Response responseRating = await http.post(
        urlIntegration,
        headers: headers,
        body: jsonEncode(body),
      );

      // Check if the response status is 200 (OK)
      if (responseRating.statusCode == 200) {
        final json = jsonDecode(responseRating.body);

        // Extract data from the response and assign to the list

        print("body is: $json");

        // Navigate to bottom navigation bar
        Get.off(bottomnavigatbar());
      } else {
        // Throw an error if the response status is not 200
        throw jsonDecode(responseRating.body)["message"] ?? "error";
      }
    } catch (e) {
      // Print error message
      print(e.toString());
    }
  }
}
