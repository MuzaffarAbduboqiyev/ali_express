import 'package:flutter/foundation.dart';

class Product extends ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final List<String> descriptionImages;
  final String oldPrice;
  final String newPrice;
  final List<String> images;
  final double rate;
  final bool freeReturn;
  int sale;
  int favoriteCount;
  bool isFavorite;
  int ordersCount;

  Product(
      {this.id,
      this.title,
      this.description,
      this.descriptionImages,
      this.oldPrice,
      this.newPrice,
      this.images,
      this.freeReturn = false,
      this.rate,
      this.sale = 0,
      this.favoriteCount = 0,
      this.isFavorite = false,
      this.ordersCount = 0});

  void changeFavouriteState() {
    if (isFavorite) {
      favoriteCount -= 1;
    } else {
      favoriteCount += 1;
    }
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
