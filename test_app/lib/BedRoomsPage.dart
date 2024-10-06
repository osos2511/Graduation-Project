import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Controllers/FavouriteController.dart';
import 'package:test_app/Controllers/GetAllPropertyByLocationControllers.dart';
import 'package:test_app/Controllers/GetPropertiesByBedRoom.dart';
import 'package:test_app/Controllers/GetPropertyByPrice.dart';
import 'Widgets/PropertyList.dart';
class BedRoomsview extends StatefulWidget {
  const BedRoomsview({super.key});
  @override
  State<BedRoomsview> createState() => _PriceviewState();
}
class _PriceviewState extends State<BedRoomsview> {
  GetAllPropertiesByBedRooms getAllPropertiesByBedRooms=Get.put(GetAllPropertiesByBedRooms());
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
                itemCount: getAllPropertiesByBedRooms.x??0,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(top:20,bottom: 15),
                    child: PropertyList(
                      image: getAllPropertiesByBedRooms.list?[index]['image'],
                      price: getAllPropertiesByBedRooms.list?[index]['price'],
                      bedrooms: getAllPropertiesByBedRooms.list?[index]['number_of_bedrooms'],
                      bathrooms: getAllPropertiesByBedRooms.list?[index]['number_of_bathrooms'],
                      area: getAllPropertiesByBedRooms.list?[index]['area'],
                      location: getAllPropertiesByBedRooms.list?[index]['location'],
                      owner: getAllPropertiesByBedRooms.list?[index]['mediator_name'],
                      typeProperty: getAllPropertiesByBedRooms.list?[index]['type'],
                      image_one: getAllPropertiesByBedRooms.list?[index]['image2'],
                      image_two: getAllPropertiesByBedRooms.list?[index]['image3'],
                      image_three: getAllPropertiesByBedRooms.list?[index]['image4'],
                      appartmentId: getAllPropertiesByBedRooms.list?[index]['id'],
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
