import 'package:aliexpress/ui/widgets/cached_image.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddToCartItem extends StatelessWidget {
  final String imageUrl;
  int id;
  int currentIndex;
  bool isSelected;

  AddToCartItem({this.imageUrl, this.id, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    isSelected = currentIndex == id;
    return Container(
      padding: EdgeInsets.all(isSelected ? 0.0 : 1.0),
      decoration: BoxDecoration(border: Border.all(color: (isSelected) ? Colors.red : Colors.grey, width: 2)),
      child: CachedImage(imageUrl),
    );
  }
}
