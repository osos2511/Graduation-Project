import 'package:flutter/cupertino.dart';

import 'Widgets/PropertyList.dart';


class Listviewwidget extends StatefulWidget {
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
  Listviewwidget ({
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
    super.key,
  });
  @override
  State<Listviewwidget> createState() => _ListviewwidgetState();
}
class _ListviewwidgetState extends State<Listviewwidget> {
  int? VAL ;
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(

      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: VAL,
      itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: PropertyList(
            image: widget.image,
            price: widget.bedrooms,
            bedrooms:widget.bedrooms ,
            bathrooms: widget.bathrooms,
            area:widget.area ,
            location:widget.location ,
            owner:widget.owner,
            typeProperty: widget.typeProperty,
            image_one: widget.image_one,
            image_two: widget.image_two,
            image_three: widget.image_three,
          ),
        );
      },
    );
  }
}
