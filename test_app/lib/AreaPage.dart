import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Controllers/FavouriteController.dart';
import 'package:test_app/Controllers/GetAllPropertyByLocationControllers.dart';
import 'package:test_app/Controllers/GetPropertiesByBedRoom.dart';
import 'package:test_app/Controllers/GetPropertyByPrice.dart';
import 'Controllers/GetPropertiesByArea.dart';
import 'Widgets/PropertyList.dart';
class AreaPage extends StatefulWidget {
  const AreaPage({super.key});
  @override
  State<AreaPage> createState() => _PriceviewState();
}
class _PriceviewState extends State<AreaPage> {
  GetAllPropertiesByArea getAllPropertiesByArea=Get.put(GetAllPropertiesByArea());
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: IconButton(onPressed: ()=>Navigator.of(context).pushNamed("Bottomnavigatbar"),icon:Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text("النتائج" ,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 30
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.deepPurple,
      body: Container(
        width: 450,
        height: 850,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurple, Colors.blueAccent])),
        child:Column(
          children: [
            Divider(thickness: 2,height: 2,),
            Container(
              height: 750,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: getAllPropertiesByArea.x??0,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(top:20,bottom: 15),
                    child: PropertyList(
                      image:getAllPropertiesByArea.list?[index]['image'],
                      price: getAllPropertiesByArea.list?[index]['price'],
                      bedrooms: getAllPropertiesByArea.list?[index]['number_of_bedrooms'],
                      bathrooms: getAllPropertiesByArea.list?[index]['number_of_bathrooms'],
                      area: getAllPropertiesByArea.list?[index]['area'],
                      location: getAllPropertiesByArea.list?[index]['location'],
                      owner: getAllPropertiesByArea.list?[index]['mediator_name'],
                      typeProperty: getAllPropertiesByArea.list?[index]['type'],
                      image_one: getAllPropertiesByArea.list?[index]['image2'],
                      image_two: getAllPropertiesByArea.list?[index]['image3'],
                      image_three: getAllPropertiesByArea.list?[index]['image4'],
                      appartmentId: getAllPropertiesByArea.list?[index]['id'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),



      ),


    );
  }
}
