import 'package:flutter/foundation.dart';

class ProductItems {
  final int id;
  final double price;
  final String imageUrl;

  ProductItems({this.id, this.price, this.imageUrl});

  Map<String, dynamic> toMap() =>
      {'id': id, 'price': price, 'imageUrl': imageUrl};

  factory ProductItems.fromMap(Map<String, dynamic> data) => ProductItems(
      id: data['id'], price: data['price'], imageUrl: data['imageUrl']);
}

class Product extends ChangeNotifier {
  int id;
  final int categoryId;
  final String title;
  final String description;
  final String oldPrice;
  final double newPriceBegin;
  final double newPriceEnd;
  final List<String> images;
  final double rate;
  final bool freeReturn;
  List<ProductItems> productItems = [];
  int sale;
  int favoriteCount;
  bool isFavorite;
  int ordersCount;

  Product(
      {this.id,
      this.categoryId,
      this.title,
      this.description,
      this.oldPrice,
      this.newPriceBegin,
      this.newPriceEnd,
      this.images,
      this.rate,
      this.freeReturn = false,
      this.productItems,
      this.sale = 0,
      this.favoriteCount = 0,
      this.isFavorite = false,
      this.ordersCount = 0});

  Map<String, dynamic> toMap() => {
        'id': id,
        'categoryId': categoryId,
        'title': title,
        'description': description,
        'oldPrice': oldPrice,
        'newPriceBegin': newPriceBegin,
        'newPriceEnd': newPriceEnd,
        'images': images.map((e) => {'image': e}).toList(),
        'rate': rate,
        'freeReturn': freeReturn,
        'productItems': productItems.map((e) => e.toMap()).toList(),
        'sale': sale,
        'favoriteCount': favoriteCount,
        'isFavorite': isFavorite,
        'ordersCount': ordersCount,
      };

  factory Product.fromMap(Map<String, dynamic> data) => Product(
      id: data['id'],
      categoryId: data['categoryId'],
      title: data['title'],
      description: data['description'],
      oldPrice: data['oldPrice'],
      newPriceBegin: data['newPriceBegin'],
      newPriceEnd: data['newPriceEnd'],
      images: (data["images"] as List<Map<String, String>>)
          .map((e) => e['image'])
          .toList(),
      rate: data['rate'],
      freeReturn: data['freeReturn'],
      productItems: (data["productItems"] as List<Map<String, dynamic>>)
          .map((e) => ProductItems.fromMap(e))
          .toList(),
      sale: data['sale'],
      favoriteCount: data['favoriteCount'],
      isFavorite: data['isFavorite'],
      ordersCount: data['ordersCount']);

  void changeFavouriteState() async {
    bool oldFavorite = isFavorite;
    int oldFavoriteCount = favoriteCount;
    if (isFavorite) {
      favoriteCount -= 1;
    } else {
      favoriteCount += 1;
    }
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
