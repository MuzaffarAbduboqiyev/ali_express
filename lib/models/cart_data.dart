import 'package:flutter/foundation.dart';

class CartData with ChangeNotifier {
  final String id;
  final int itemId;
  int quantity;
  final double price;
  final bool isFree;

  CartData({this.id, this.itemId, this.quantity, this.price, this.isFree = false});

  Map<String, dynamic> toMap() => {
        'id': id,
        'itemId': itemId,
        'quantity': quantity,
        'price': price,
        'isFree': isFree
      };

  factory CartData.fromMap(Map<String, dynamic> data) => CartData(
      id: data['id'],
      itemId: data['itemId'],
      quantity: data['quantity'],
      price: data['price'],
      isFree: data['isFree']);

  void changeQuantity(int count) {
    quantity = count;
    notifyListeners();
  }
}
