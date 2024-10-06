import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Controllers/FavouriteController.dart';
import 'package:test_app/Controllers/GetPropertyByPrice.dart';

import 'Controllers/GetAllPropertybyType.dart';
import 'Widgets/PropertyList.dart';
class Typeresults extends StatefulWidget {
  const Typeresults({super.key});
  @override
  State<Typeresults> createState() => _TyperesultsState();
}
class _TyperesultsState extends State<Typeresults> {
  Getallpropertybytype getAllPropertiesByType=Get.put(Getallpropertybytype());
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
                itemCount: getAllPropertiesByType.x,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(top:20,bottom: 15),
                    child: PropertyList(
                      image: getAllPropertiesByType.list?[index]['image'],
                      price: getAllPropertiesByType.list?[index]['price'],
                      bedrooms: getAllPropertiesByType.list?[index]['number_of_bedrooms'],
                      bathrooms: getAllPropertiesByType.list?[index]['number_of_bathrooms'],
                      area: getAllPropertiesByType.list?[index]['area'],
                      location: getAllPropertiesByType.list?[index]['location'],
                      owner: getAllPropertiesByType.list?[index]['mediator_name'],
                      typeProperty: getAllPropertiesByType.list?[index]['type'],
                      image_one: getAllPropertiesByType.list?[index]['image2'],
                      image_two: getAllPropertiesByType.list?[index]['image3'],
                      image_three: getAllPropertiesByType.list?[index]['image4'],
                      appartmentId: getAllPropertiesByType.list?[index]['id'],
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
