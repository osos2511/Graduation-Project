
class PropertyItem {
  final int id;
  final String title;
  final String type;
  final String description;
  final String numberOfBedrooms;
  final String numberOfBathrooms;
  final String location;
  final String area;
  final String price;
  final String mediatorName;
  final String image;
  final String image2;
  final String image3;
  final String image4;
  final String? image5;
  final String? image6;
  final String? userId;
  final String mediatorId;
  final DateTime createdAt;
  final DateTime updatedAt;

  PropertyItem({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.numberOfBedrooms,
    required this.numberOfBathrooms,
    required this.location,
    required this.area,
    required this.price,
    required this.mediatorName,
    required this.image,
    required this.image2,
    required this.image3,
    required this.image4,
    this.image5,
    this.image6,
    this.userId,
    required this.mediatorId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PropertyItem.fromJson(Map<String, dynamic> json) {
    return PropertyItem(
        id: json['id'],
        title: json['title'],
        type: json['type'],
        description: json['description'],
        numberOfBedrooms: json['number_of_bedrooms'],
        numberOfBathrooms: json['number_of_bathrooms'],
        location: json['location'],
        area: json['area'],
        price: json['price'],
        mediatorName: json['mediator_name'],
        image: json['image'],
        image2: json['image2'],
        image3: json['image3'],
        image4: json['image4'],
        image5: json['image5'],
        image6: json['image6'],
        userId: json['user_id'],
        mediatorId: json['mediator_id'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        );
    }
}


