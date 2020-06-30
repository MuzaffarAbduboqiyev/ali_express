import 'dart:convert';

import 'package:aliexpress/models/sub_category_data.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class CategoryData {
  final int id;
  final String name;
  final String imageUrl;
  bool isSelected;
  List<SubCategoryData> subCategories = [];

  CategoryData(
      {@required this.id,
      @required this.name,
      @required this.imageUrl,
      this.subCategories,
      this.isSelected = false
      });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'imageUrl': imageUrl,
        'subCategories': subCategories
            .map((e) => (e.isExpand) ? e.toMap() : e.toMapWithoutTree())
            .toList()
      };

  factory CategoryData.fromMap(Map<String, dynamic> data) =>
      CategoryData(
          id: data['id'],
          name: data['name'],
          imageUrl: data['imageUrl'],
          subCategories: (data['subCategories'] as List<dynamic>)
              .map((e) => (e['isExpand'])
                  ? SubCategoryData.fromMap(e)
                  : SubCategoryData.fromMapWithoutTree(e))
              .toList());
//          subCategories: (List<Map<String, dynamic>>.from(data['subCategories'])).map((e) => SubCategoryData.fromMap(e)).toList());
}
