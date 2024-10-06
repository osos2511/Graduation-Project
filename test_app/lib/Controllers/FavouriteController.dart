import 'package:get/get.dart';

class FavoritesController extends GetxController {
  var favoriteAppartment = <Map<String, dynamic>>[].obs;

  void toggleFavorite(Map<String, dynamic> Appartment) {
    if (isFavorite(Appartment)) {
      favoriteAppartment
          .removeWhere((element) => element['id'] == Appartment['id']);
    } else {
      favoriteAppartment.add(Appartment);
    }
  }

  bool isFavorite(Map<String, dynamic> Appartment) {
    return favoriteAppartment.any((element) => element['id'] == Appartment['id']);
    }
}