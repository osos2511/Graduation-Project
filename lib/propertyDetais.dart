
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class PropertyDetails extends StatefulWidget {
  String? ownerProp;
  String? priceProp;
  String? typeProp;
  String? bedRooms;
  String? bathRooms;
  String? location;
  String?image_one;
  String?image_two;
  String?image_three;
    PropertyDetails(
        this.ownerProp,
        this.priceProp,
        this.typeProp,
        this.bedRooms,
        this.bathRooms,
        this.location,
        this.image_one,
        this.image_two,
        this.image_three,
        {super.key}
        );
  @override
  State<PropertyDetails> createState() => _PropertyDetailsState();
}
class _PropertyDetailsState extends State<PropertyDetails> {
  @override
  Widget build(BuildContext context) {
    final List<String?>items=[
      widget.image_one,
      widget.image_two,
      widget.image_three,
    ];
    var _bannerList;
return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(onPressed: (){Navigator.of(context).pop("homepage");}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        //toolbarHeight: 0,
      ),
         backgroundColor:Colors.blue ,
        body:Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.deepPurple, Colors.blueAccent])),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                    width: 700,
                    height: 250,
                    child: Swiper(itemBuilder: (BuildContext context,int index){
                      return Image.network("https://semsark.xyz/storage/app/public/${items[index]}",fit: BoxFit.fill,);
                    },
                    itemCount:3,
                    pagination: SwiperPagination(),
                      controller: SwiperController(),
                      control: SwiperControl(color: Colors.white),
                    ),

                  ),
                ),
                 SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${widget.ownerProp}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      Spacer(
                        flex: 3,
                      ),
                      Text("أسم المالك",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 9.0,right: 0.1),
                    child: Divider(height: 4,color: Colors.white,),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${widget.priceProp}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      Spacer(
                        flex: 3,
                      ),
                      Text("السعر",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 9.0,right: 0.1),
                    child: Divider(height: 4,color: Colors.white,),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${widget.typeProp}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      Spacer(
                        flex: 3,
                      ),
                      Text("نوع العمليه ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 9.0,right: 0.1),
                    child: Divider(height: 4,color: Colors.white,),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${widget.bedRooms}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      Spacer(
                        flex: 3,
                      ),
                      Text("عدد الغرف ",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 9.0,right: 0.1),
                    child: Divider(height: 4,color: Colors.white,),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${widget.bathRooms}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      Spacer(
                        flex: 3,
                      ),
                      Text("عدد الحمامات",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 9.0,right: 0.1),
                    child: Divider(height: 4,color: Colors.white,),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${widget.location}",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                      Spacer(
                        flex: 3,
                      ),
                      Text("العنوان",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 9.0,right: 0.1),
                    child: Divider(height: 4,color: Colors.white,),
                  ),
                  SizedBox(height: 20),
                ],
                ),
            ),
          ),
        ),
        );
  }
}