
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/typeResults.dart';
import '../Models/PropertyModel.dart';
import '../Utils/EndPointApi.dart';

class Getallpropertybytype {
  TextEditingController SearchController = TextEditingController();
  List<dynamic>?list;
  int? x;
  var urlIntegration =
      ApiEndPoints.BaseUrl + ApiEndPoints.AllPropertyApi.propertytype;

  Future<void> fetchAllPropertiesByType() async {
    try{ final response = await Dio().get(urlIntegration+SearchController.text);

    if (response.statusCode == 200) {
      list = response.data['properties'];
      x=list?.length;
      for (var item in list!) {
        //PropertyItem jsonData = PropertyItem.fromJson(item);
        //propertyList.add(jsonData);
        print(item);
      }
      print(response.data);
      Get.off(Typeresults());// Print the full JSON response if needed
    } else {
      print('Error: ${response.statusCode}');
    }}catch(e){print(e.toString());}
    // return propertyList;
  }
}