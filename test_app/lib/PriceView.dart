import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Controllers/FavouriteController.dart';
import 'package:test_app/Controllers/GetPropertyByPrice.dart';
import 'Widgets/PropertyList.dart';
class Priceview extends StatefulWidget {
  const Priceview({super.key});
  @override
  State<Priceview> createState() => _PriceviewState();
}
class _PriceviewState extends State<Priceview> {
  GetAllPropertiesByPrice getAllPropertiesByPrice=Get.put(GetAllPropertiesByPrice());
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
              itemCount: getAllPropertiesByPrice.x,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.only(top:20,bottom: 15),
                  child: PropertyList(
                    image: getAllPropertiesByPrice.list?[index]['image'],
                    price: getAllPropertiesByPrice.list?[index]['price'],
                    bedrooms: getAllPropertiesByPrice.list?[index]['number_of_bedrooms'],
                    bathrooms: getAllPropertiesByPrice.list?[index]['number_of_bathrooms'],
                    area: getAllPropertiesByPrice.list?[index]['area'],
                    location: getAllPropertiesByPrice.list?[index]['location'],
                    owner: getAllPropertiesByPrice.list?[index]['mediator_name'],
                    typeProperty: getAllPropertiesByPrice.list?[index]['type'],
                    image_one: getAllPropertiesByPrice.list?[index]['image2'],
                    image_two: getAllPropertiesByPrice.list?[index]['image3'],
                    image_three: getAllPropertiesByPrice.list?[index]['image4'],
                    appartmentId: getAllPropertiesByPrice.list?[index]['id'],
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
