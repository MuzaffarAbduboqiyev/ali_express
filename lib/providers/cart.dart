import 'package:aliexpress/models/cart_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  Map<String, CartData> _items = {};
  List<String> _selectedItems = [];
  double result = 0.0;
  bool _isSelectedAll = false;

  Map<String, CartData> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  int get selectedItemsCount{
    return _selectedItems.length;
  }

  void deleteSelectedItems(){
    result = 0.0;
    _isSelectedAll = false;
    _selectedItems.forEach((key) {
      _items.remove(key);
    });
    _selectedItems = [];
    notifyListeners();
  }

  bool get isSelectedAllItems{
    return _isSelectedAll;
  }

  bool isSelectedItem(String key){
    if(_selectedItems.contains(key)){
      return true;
    }
    return false;
  }

  void selectAllItems(bool state){
    result = 0.0;
    _isSelectedAll = state;
    if(state){
      _selectedItems.clear();
      _selectedItems.addAll(_items.keys);
      _items.forEach((key, value) {
        result += value.quantity * value.price;
        if(!value.isFree){
          result += 1;
        }
      });
    }else{
      _selectedItems = [];
    }
    notifyListeners();
  }

  void indexSelected(String key, bool value) {
    double sum = (_items[key].price * _items[key].quantity);
    if(value){
      _selectedItems.add(key);
      if (!_items[key].isFree)
        result += 1;
      result += sum;
    }else{
      _selectedItems.remove(key);
      if (!_items[key].isFree)
        result -= 1;
      result -= sum;
    }

    if(_selectedItems.length < _items.length){
      _isSelectedAll = false;
    }else if(_selectedItems.length == _items.length){
      _isSelectedAll = true;
    }
    notifyListeners();
  }

  void updateQuantity(String key, int count){
    result -= _items[key].quantity * _items[key].price;
    result += _items[key].price * count;
    _items.update(key, (oldData) => CartData(
        id: oldData.id,
        itemId: oldData.itemId,
        quantity: count,
        price: oldData.price,
        isFree: oldData.isFree
    ));
    notifyListeners();
  }

  void addCartItem(int productId, int itemId, int quantity, double price, bool isFree) {
    String key = '$productId';
    if (_items.containsKey(key)) {
      _items.update(
          key,
          (oldData) => CartData(
              id: oldData.id,
              itemId: itemId,
              quantity: quantity,
              price: price,
            isFree: isFree
          ));
    } else {
      _items.putIfAbsent(
          key,
          () => CartData(
              id: DateTime.now().toIso8601String(),
              itemId: itemId,
              quantity: quantity,
              price: price,
            isFree: isFree
          ));
    }
    notifyListeners();
  }

  void removeItem(int productId) {
    String key = '$productId';
    if (!_items.containsKey(key)) {
      return;
    }
    _items.remove(key);
    notifyListeners();
  }

  double get resultPrice {
    return double.parse(result.toStringAsFixed(2));
  }

  CartData getCartItemByProductId(String productId){
    if(!_items.containsKey(productId)){
      return null;
    }
    return _items[productId];
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
