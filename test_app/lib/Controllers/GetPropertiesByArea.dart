import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/AreaPage.dart';
import 'package:test_app/BedRoomsPage.dart';
import '../Models/PropertyModel.dart';
import '../Utils/EndPointApi.dart';

class GetAllPropertiesByArea {
  TextEditingController AreaController = TextEditingController();
  List<dynamic>?list;
  int? x;
  var urlIntegration =
      ApiEndPoints.BaseUrl + ApiEndPoints.AllPropertyApi.Area;

  Future<void> fetchAllPropertiesByArea() async {
    try{
      final response = await Dio().get(urlIntegration+AreaController.text);

      if (response.statusCode == 200) {
        list = response.data['properties'];
        x=list?.length;
        for (var item in list!) {
          print(item);
        }
        print(response.data);
        Get.off(AreaPage());// Print the full JSON response if needed
      } else {
        print('Error: ${response.statusCode}');
      }}catch(e){print(e.toString());}
    // return propertyList;
  }
}