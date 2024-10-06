
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:test_app/Controllers/FavouriteController.dart';
import 'package:test_app/Controllers/RatingController.dart';
import '../Controllers/GetAllPropertiesController.dart';
import '../propertyDetais.dart';

class PropertyList extends StatefulWidget {
  String? price;
  String? bedrooms;
  String? bathrooms;
  String? location;
  String? owner;
  String? typeProperty;
  String? image;
  String?area;
  String?image_one;
  String?image_two;
  String?image_three;
  int? appartmentId;
  PropertyList({
    this.price,
    this.location,
    this.bathrooms,
    this.bedrooms,
    this.owner,
    this.typeProperty,
    this.image,
    this.area,
    this.image_one,
    this.image_two,
    this.image_three,
    this.appartmentId,
    super.key,
  });
  @override
  State<PropertyList> createState() => _PropertyListState();
}
class _PropertyListState extends State<PropertyList> {
  Color buttonColor=Colors.white;
  Color focusColor=Colors.white;
  bool colChanged=true;
   String? own;
   RatingController ratingController=Get.put(RatingController());
  //Future<List<Data>> dataView= GetAllProperties().AllProperties();
  GetAllProperties prop =Get.put(GetAllProperties());
  @override
  Widget build(BuildContext context) {
    FavoritesController favoritesController=Get.find<FavoritesController>();
    final favAppartment={
      'id':widget.appartmentId,
      'image':widget.image,
      'price':widget.price,
      'area':widget.area,
      'location':widget.location,
      'number_of_bedrooms':widget.bedrooms,
      'number_of_bathrooms':widget.bathrooms,
      'mediator_name':widget.owner,
      'image2':widget.image_one,
      'image3':widget.image_two,
      'image4':widget.image_three,
      'type':widget.typeProperty,
    };
    return MaterialButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PropertyDetails(widget.owner,widget.price,widget.typeProperty,widget.bedrooms,widget.bathrooms,widget.location,widget.image_one,widget.image_two,widget.image_three)));
      //print(widget.owner);
      },
      child: Container(
        width: 500,
        height: 355,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
          Image.network("https://semsark.xyz/storage/app/public/${widget.image}",
            height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      //rating
                      Spacer(
                        flex: 1,
                      ),//
                      RatingBar.builder(
                          itemSize:25,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemBuilder: (context,_)=>Icon(Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating){
                            ratingController.ratingController=rating.toInt();
                            ratingController.propertyIdController=widget.appartmentId;
                            ratingController.Rating();
                          print(rating);
                      }),
                      Spacer(
                        flex: 15,
                      ),
                      Text("${widget.price} EGP",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("${widget.location}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: (){
                          setState(() {
                            favoritesController.toggleFavorite(favAppartment);
                            favoritesController.isFavorite(favAppartment);
                          });
                        },

                        icon:
                        favoritesController.isFavorite(favAppartment)?
                        Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border),
                        iconSize: 30,
                        color: focusColor,
                      ),
                      Spacer(
                        flex: 3,
                      ),
                      Text("${widget.area} m",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.social_distance,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text("${widget.bathrooms}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.bathtub,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text("${widget.bedrooms}",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.bed,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}