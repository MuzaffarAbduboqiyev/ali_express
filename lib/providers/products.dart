import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:aliexpress/providers/product.dart';

class Products extends ChangeNotifier {
  List<Product> _items = _fetchAndSetProducts;

  List<Product> get items {
    return [..._items];
  }

  Product getProductById(int productId) {
    return _items.firstWhere((product) => product.id == productId);
  }

  List<Product> getProductsByProduct(Product product){
    List<Product> products = _items.where((element) => element.categoryId == product.categoryId).toList();
    products.remove(product);
    return products;
  }

  List<Product> getProductsByCategory(int categoryId) {
    return _items.where((product) => product.categoryId == categoryId).toList();
  }

  List<Product> searchProductItems(String searchWord) {
    List<Product> _searchItems = [];
    _items.map((e) {
      if (e.title.toLowerCase().contains(searchWord.toLowerCase())) {
        _searchItems.add(e);
      }
    }).toList();
    return _searchItems;
  }

  static List<Product> get _fetchAndSetProducts {
    List<Product> _item = [];
    int j = 0;
    for (int i = 200; i <= 241; i++) {
      for (int k = 0; k < 10; k++) {
        _item.add(Product(
            id: j,
            categoryId: i,
            title:
                "Luxury quality 777 Mixed colors Business Office Fountain Pen student_$j",
            description: "",
            oldPrice: "0.99 - 1.29",
            newPriceBegin: (j + 0.10),
            newPriceEnd: (j + 0.95),
            images: [
              "https://picsum.photos/id/${j + 8}/200/300.jpg",
              "https://picsum.photos/id/${j + 9}/200/300.jpg",
              "https://picsum.photos/id/${j + 10}/200/300.jpg",
              "https://picsum.photos/id/${j + 11}/200/300.jpg",
              "https://picsum.photos/id/${j + 12}/200/300.jpg",
              "https://picsum.photos/id/${j + 13}/200/300.jpg"
            ],
            rate: 5.0,
            freeReturn: (j % 2 == 0) ? true : false,
            productItems: [
              ProductItems(id: 0, price: (j + 0.10), imageUrl: "https://picsum.photos/id/${i + k + j + 1}/200/300.jpg"),
              ProductItems(id: 1, price: (j + 0.20), imageUrl: "https://picsum.photos/id/${i + k + j + 2}/200/300.jpg"),
              ProductItems(id: 2, price: (j + 0.30), imageUrl: "https://picsum.photos/id/${i + k + j + 3}/200/300.jpg"),
              ProductItems(id: 3, price: (j + 0.40), imageUrl: "https://picsum.photos/id/${i + k + j + 4}/200/300.jpg"),
              ProductItems(id: 4, price: (j + 0.50), imageUrl: "https://picsum.photos/id/${i + k + j + 5}/200/300.jpg"),
              ProductItems(id: 5, price: (j + 0.60), imageUrl: "https://picsum.photos/id/${i + k + j + 7}/200/300.jpg"),
              ProductItems(id: 6, price: (j + 0.70), imageUrl: "https://picsum.photos/id/${i + k + j + 8}/200/300.jpg"),
              ProductItems(id: 7, price: (j + 0.80), imageUrl: "https://picsum.photos/id/${i + k + j + 9}/200/300.jpg"),
              ProductItems(id: 8, price: (j + 0.90), imageUrl: "https://picsum.photos/id/${i + k + j + 0}/200/300.jpg"),
              ProductItems(id: 9, price: (j + 0.95), imageUrl: "https://picsum.photos/id/${i + k + j + 6}/200/300.jpg"),
            ],
            sale: 26,
            favoriteCount: 940,
            ordersCount: 597));
        j++;
      }
    }

    for (int i = 102; i <= 108; i = i + 3) {
      for (int k = 0; k < 10; k++) {
        _item.add(Product(
            id: j,
            categoryId: i,
            title:
                "Luxury quality 777 Mixed colors Business Office Fountain Pen student_$j",
            description: "",
            oldPrice: "0.99 - 1.29",
            newPriceBegin: (j + 0.30),
            newPriceEnd: (j + 0.90),
            images: [
              "https://picsum.photos/id/${j + 8}/200/300.jpg",
              "https://picsum.photos/id/${j + 9}/200/300.jpg",
              "https://picsum.photos/id/${j + 10}/200/300.jpg",
              "https://picsum.photos/id/${j + 11}/200/300.jpg",
              "https://picsum.photos/id/${j + 12}/200/300.jpg",
              "https://picsum.photos/id/${j + 13}/200/300.jpg"
            ],
            rate: 5.0,
            freeReturn: (j % 2 == 0) ? true : false,
            productItems: [
              ProductItems(id: 0, price: (j + 0.30), imageUrl: "https://picsum.photos/id/${i + k + j + 1}/200/300.jpg"),
              ProductItems(id: 1, price: (j + 0.40), imageUrl: "https://picsum.photos/id/${i + k + j + 2}/200/300.jpg"),
              ProductItems(id: 2, price: (j + 0.50), imageUrl: "https://picsum.photos/id/${i + k + j + 3}/200/300.jpg"),
              ProductItems(id: 3, price: (j + 0.60), imageUrl: "https://picsum.photos/id/${i + k + j + 4}/200/300.jpg"),
              ProductItems(id: 4, price: (j + 0.70), imageUrl: "https://picsum.photos/id/${i + k + j + 5}/200/300.jpg"),
              ProductItems(id: 5, price: (j + 0.90), imageUrl: "https://picsum.photos/id/${i + k + j + 6}/200/300.jpg"),
            ],
            sale: 26,
            favoriteCount: 940,
            ordersCount: 597));
        j++;
      }
    }
    return _item;
  }
}
