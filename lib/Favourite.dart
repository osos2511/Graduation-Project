import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Controllers/FavouriteController.dart';

import 'Widgets/PropertyList.dart';

class Fav extends StatefulWidget {
  const Fav({super.key});
  @override
  State<Fav> createState() => _FavState();
}
class _FavState extends State<Fav> {
  @override

  Widget build(BuildContext context) {
    FavoritesController favoritesController=Get.find<FavoritesController>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar:AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text("المحفوظات" ,
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

          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple, Colors.blueAccent])),
          child:
              Obx((){
                return ListView.builder(
                  itemCount: favoritesController.favoriteAppartment.length,
                  itemBuilder: (context,index){
                    final appartment=favoritesController.favoriteAppartment[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: PropertyList(
                        appartmentId: appartment['id'],
                        image: appartment['image'],
                        price: appartment['price'],
                        bedrooms: appartment['number_of_bedrooms'],
                        bathrooms: appartment['number_of_bathrooms'],
                        area: appartment['area'],
                        location: appartment['location'],
                        owner: appartment['mediator_name'],
                        typeProperty: appartment['type'],
                        image_one: appartment['image2'],
                        image_two: appartment['image3'],
                        image_three: appartment['image4'],
                      ),
                    );
                  });}),


          ),

        ),
    );
  }
}
