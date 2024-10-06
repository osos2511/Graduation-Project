

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/Controllers/GetPropertiesByArea.dart';
import 'package:test_app/Controllers/GetPropertiesByBedRoom.dart';

import 'Controllers/GetAllPropertiesController.dart';
import 'Controllers/GetAllPropertyByLocationControllers.dart';
import 'Controllers/GetAllPropertybyType.dart';
import 'Controllers/GetPropertyByPrice.dart';
import 'Widgets/PropertyList.dart';
import 'myAccount.dart';
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ispressed = false;
  int selectedIndex = 2;
  bool val=false;
  Color buyColor=Colors.white;
  Color rentColor=Colors.red;
  bool Color1=true;
  var value="ايجار";
  GetAllPropertiesByLocation getByLocation=Get.put(GetAllPropertiesByLocation());
  GetAllProperties variable=Get.put(GetAllProperties());
  GetAllPropertiesByPrice getAllPropertiesByPrice=Get.put(GetAllPropertiesByPrice());
  Getallpropertybytype getbytype =Get.put(Getallpropertybytype());
  GetAllPropertiesByBedRooms getAllPropertiesByBedRooms=Get.put(GetAllPropertiesByBedRooms());
  GetAllPropertiesByArea getAllPropertiesByArea=Get.put(GetAllPropertiesByArea());
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () { Navigator.of(context).pushNamed("homepage"); },),
        actions: [
          IconButton(onPressed: (){
            getByLocation.x=0;
            Navigator.of(context).pushNamed("searchPage");
          },
            icon: Icon(Icons.search,color:Colors.white),)
        ],
      ),
      backgroundColor: Colors.blue,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurple, Colors.blueAccent])),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Container(
                width: 800,
                height: 40,
                child: ListView(
                  reverse: true,
                  physics:const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 130,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              color: Colors.white,

                    ),
                      child: MaterialButton(onPressed: (){
                        setState(() {
                          showModalBottomSheet(context: context, builder: (context) {
                            return Container(
                              height: 300,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Spacer(flex: 1,),
                                      Text("تحديد العمليه" , style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800
                                      ),),
                                      Spacer(
                                        flex: 12,
                                      ),
                                      IconButton(onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                        icon:Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.deepPurple,
                                  ),
                                  Spacer(flex: 1,),

                                  Row(
                                    children: [
                                      Spacer(
                                        flex: 1,
                                      ),
                                      Container(
                                        child: ElevatedButton(
                                          onPressed: (){
                                            setState(() {
                                              getbytype.SearchController.text="بيع";
                                              getbytype.fetchAllPropertiesByType();
                                             // Navigator.of(context).pushNamed("TypeResults");
                                            });

                                          }
                                          , child: Text("بيع",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ),
                                        ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(13),
                                            ),
                                            backgroundColor: Colors.deepPurple,
                                          ),
                                        ),
                                        width: 180,
                                        height: 80,
                                      ),
                                      Spacer(
                                        flex: 2,
                                      ),
                                      Container(
                                        child: ElevatedButton(
                                          onPressed: (){
                                            setState(() {
                                              getbytype.SearchController.text="ايجار";
                                              getbytype.fetchAllPropertiesByType();
                                              //Navigator.of(context).pushNamed("TypeResults");
                                            });

                                          }

                                          , child: Text("ايجار",
                                          style: TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white
                                          ),
                                        ),
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(13),
                                            ),
                                            backgroundColor: Colors.deepPurple,
                                          ),
                                        ),
                                        width: 180,
                                        height: 80,
                                                                  ),
                                      Spacer(flex: 1,),


                                ],
                              ),
                                  Spacer(flex: 2,),
                            ],
                              ),
                            );
                          },
                          );
                        });
                      },
                      child:Text("حدد نوع العملية",style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w800, ),),),
                    ),
                    SizedBox(
                      width: 11,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white
                      ),
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(context: context, builder: (context) {
                            return Container(
                              height: 300,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Spacer(flex: 1,),
                                      Text("تحديد السعر" , style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800
                                      ),),
                                      Spacer(
                                        flex: 12,
                                      ),
                                      IconButton(onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                        icon:Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.deepPurple,
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Form(
                                    child: Row(
                                      children: [
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Container(
                                          child: TextFormField(
                                            controller:getAllPropertiesByPrice.MaxPrice,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: BorderSide(color:Colors.deepPurple , width:1.5),
                                              ),
                                              hintText: "أعلي سعر",
                                            ),
                                            textAlign: TextAlign.right,
                                            keyboardType: TextInputType.number,
                                          ),
                                          width: 180,
                                          height: 60,
                                        ),
                                        Spacer(
                                          flex: 2,
                                        ),
                                        Container(
                                          child:  TextFormField(
                                            controller:getAllPropertiesByPrice.MinPrice,
                                            decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                borderSide: BorderSide(color: Colors.deepPurple , width: 1.5),
                                              ),
                                              hintText: "أقل سعر",
                                            ),
                                            textAlign: TextAlign.right,
                                            keyboardType: TextInputType.number,
                                          ),
                                          width: 180,
                                          height: 60,
                                        ),
                                        Spacer(
                                          flex: 1,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(
                                    flex: 3,
                                  ),
                                  Container(
                                    child: ElevatedButton(
                                      onPressed: (){
                                        getAllPropertiesByPrice.fetchAllPropertiesByPrice();
                                        Navigator.of(context).pushNamed("priceview");
                                      }
                                      , child: Text("اظهار النتائج",
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.white
                                      ),
                                    ),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(13),
                                        ),
                                        backgroundColor: Colors.deepPurple,
                                      ),
                                    ),
                                    width: 300,
                                    height: 50,
                                  ),
                                  Spacer(
                                    flex: 3,
                                  ),
                                ],
                              ),
                            );
                          },
                          );
                        },
                        child: const Text(
                          "حدد السعر",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white
                      ),
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(context: context, builder: (context) {
                            return Container(
                              height: 300,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Spacer(
                                        flex: 1,
                                      ),
                                      Text("تحديد الغرف" , style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800
                                      ),),
                                      Spacer(
                                        flex: 12,
                                      ),
                                      IconButton(onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                        icon:Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.deepPurple,
                                  ),
                                  Spacer(
                                    flex: 2,
                                  ),
                                  Center(
                                    child: Container(
                                      child: TextFormField(

                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(color:Colors.deepPurple , width:1.5),
                                          ),
                                          hintText: "عدد الغرف",
                                        ),
                                        controller: getAllPropertiesByBedRooms.BedRoomsController,
                                        textAlign: TextAlign.right,
                                        keyboardType: TextInputType.number,
                                      ),
                                      width: 200,
                                      height: 60,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 2,
                                  ),

                                  Container(
                                    child: ElevatedButton(
                                      onPressed: (){
                                        getAllPropertiesByBedRooms.fetchAllPropertiesByBedRooms();
                                        Navigator.of(context).pushNamed("BedRooms");
                                      }
                                      , child: Text("اظهار النتائج",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white
                                      ),
                                    ),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(13),
                                        ),
                                        backgroundColor: Colors.deepPurple,
                                      ),
                                    ),
                                    width: 300,
                                    height: 50,
                                  ),
                                  Spacer(
                                    flex: 3,
                                  ),
                                ],
                              ),
                            );
                          },
                          );
                        },
                        child: const Text(
                          "حدد غرف النوم",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),



                    const SizedBox(
                      width: 12,
                    ),

                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white
                      ),
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(context: context, builder: (context) {
                            return Container(
                              height: 300,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Spacer(
                                        flex: 1,
                                      ),
                                      Text("تحديد المساحة" , style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800
                                      ),),
                                      Spacer(
                                        flex: 12,
                                      ),
                                      IconButton(onPressed: (){
                                        Navigator.of(context).pop();
                                      },
                                        icon:Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.deepPurple,
                                  ),
                                  Spacer(
                                    flex: 2,
                                  ),
                                  Center(
                                    child: Container(
                                      child: TextFormField(

                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(12),
                                            borderSide: BorderSide(color:Colors.deepPurple , width:1.5),
                                          ),
                                          hintText: "حدد المساحة",
                                        ),
                                        controller: getAllPropertiesByArea.AreaController,
                                        textAlign: TextAlign.right,
                                        keyboardType: TextInputType.number,
                                      ),
                                      width: 200,
                                      height: 60,
                                    ),
                                  ),
                                  Spacer(
                                    flex: 2,
                                  ),

                                  Container(
                                    child: ElevatedButton(
                                      onPressed: (){
                                        getAllPropertiesByArea.fetchAllPropertiesByArea();
                                        Navigator.of(context).pushNamed("areaPage");
                                      }
                                      , child: Text("اظهار النتائج",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white
                                      ),
                                    ),
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(13),
                                        ),
                                        backgroundColor: Colors.deepPurple,
                                      ),
                                    ),
                                    width: 300,
                                    height: 50,
                                  ),
                                  Spacer(
                                    flex: 3,
                                  ),
                                ],
                              ),
                            );
                          },
                          );
                        },
                        child: const Text(
                          "حدد المساحة",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
                height: 37,
                width: 400,
                child: Divider(
                  color: Colors.white,
                  thickness: 1.2,
                )),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,

                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: variable.x,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: PropertyList(
                        image: variable.list?[index]['image'],
                        price: variable.list?[index]['price'],
                        bedrooms: variable.list?[index]['number_of_bedrooms'],
                        bathrooms: variable.list?[index]['number_of_bathrooms'],
                        area: variable.list?[index]['area'],
                        location: variable.list?[index]['location'],
                        owner: variable.list?[index]['mediator_name'],
                        typeProperty: variable.list?[index]['type'],
                        image_one: variable.list?[index]['image2'],
                        image_two: variable.list?[index]['image3'],
                        image_three: variable.list?[index]['image4'],
                        appartmentId: variable.list?[index]['id'],
                      ),
                    );
                  },
                ),
              ),
            ),



            // Expanded(
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.vertical,
            //     child: ListView.builder(
            //       shrinkWrap: true,
            //       physics: NeverScrollableScrollPhysics(),
            //       itemCount: variable.x,
            //       itemBuilder: (context,index){
            //         return Padding(
            //           padding: const EdgeInsets.only(bottom: 15),
            //           child: PropertyList(
            //             image: variable.list?[index]['image'],
            //             price: variable.list?[index]['price'],
            //             bedrooms: variable.list?[index]['number_of_bedrooms'],
            //             bathrooms: variable.list?[index]['number_of_bathrooms'],
            //             area: variable.list?[index]['area'],
            //             location: variable.list?[index]['location'],
            //             owner: variable.list?[index]['mediator_name'],
            //             typeProperty: variable.list?[index]['type'],
            //             image_one: variable.list?[index]['image2'],
            //             image_two: variable.list?[index]['image3'],
            //             image_three: variable.list?[index]['image4'],
            //             appartmentId: variable.list?[index]['id'],
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}




