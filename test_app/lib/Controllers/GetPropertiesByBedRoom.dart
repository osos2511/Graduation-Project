// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:http/http.dart' as http;
//
// import '../Models/PropertyModel.dart';
// import '../Utils/EndPointApi.dart';
//
// class GetAllProperties{
//   Map<String,dynamic> PropertyData={};
//
//   var urlIntegration=
//       ApiEndPoints.BaseUrl+ApiEndPoints.AllPropertyApi.Properties;
//   Future<Map<String,dynamic >> AllProperties() async{
//     final response=await Dio().get(urlIntegration);
//
//     final JsonData=response.data;
//     List<dynamic>list=response.data['data'];
//     if(response.statusCode==200)
//     {
//
//       print(JsonData);
//       for(int i=0;i<list.length;i++){
//         PropertyItem  jsonData=new PropertyItem.fromJson(list[i]);
//         PropertyData.addAll(jsonData as Map<String, dynamic>);
//       }
//
//       var data=jsonDecode(response.data);
//       print(data.toString());
//     }else{
//       print(response.statusCode);
//     }
//     return PropertyData;
//     }
// }
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/BedRoomsPage.dart';
import '../Models/PropertyModel.dart';
import '../Utils/EndPointApi.dart';

class GetAllPropertiesByBedRooms {
  TextEditingController BedRoomsController = TextEditingController();
  List<dynamic>?list;
  int? x;
  var urlIntegration =
      ApiEndPoints.BaseUrl + ApiEndPoints.AllPropertyApi.BedRooms;

  Future<void> fetchAllPropertiesByBedRooms() async {
    try{
      final response = await Dio().get(urlIntegration+BedRoomsController.text);

    if (response.statusCode == 200) {
      list = response.data['properties'];
      x=list?.length;
      for (var item in list!) {
        print(item);
      }
      print(response.data);
      Get.off(BedRoomsview());// Print the full JSON response if needed
    } else {
      print('Error: ${response.statusCode}');
    }}catch(e){print(e.toString());}
    // return propertyList;
  }
}