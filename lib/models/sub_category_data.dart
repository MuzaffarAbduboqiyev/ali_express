import 'tree_category_data.dart';
import 'package:flutter/foundation.dart';

class SubCategoryData {
  final int id;
  final int categoryId;
  final String name;
  List<TreeCategoryData> treeCategories = [];
  bool isExpand;
  bool isSelected;

  SubCategoryData({
    @required this.id,
    @required this.name,
    @required this.categoryId,
    this.treeCategories,
    this.isExpand = false,
    this.isSelected = false,
  });

  factory SubCategoryData.fromMap(Map<String, dynamic> data) {
    return SubCategoryData(
        id: data['id'],
        name: data['name'],
        isExpand: data['isExpand'],
        categoryId: data['categoryId'],
        treeCategories: (data['treeCategories'] as List<dynamic>).map((e) => TreeCategoryData.fromMap(e)).toList()
    );

  }

  factory SubCategoryData.fromMapWithoutTree(Map<String, dynamic> data) {
    return SubCategoryData(
        id: data['id'],
        name: data['name'],
        isExpand: data['isExpand'],
        categoryId: data['categoryId']);
//        treeCategories: (List<Map<String, dynamic>>.from(data['treeCategories'])).map((e) => TreeCategoryData.fromMap(e)).toList());
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'isExpand': isExpand,
        'categoryId': categoryId,
        'treeCategories': treeCategories.map((e) => e.toMap()).toList()
      };

  Map<String, dynamic> toMapWithoutTree() => {
        'id': id,
        'name': name,
        'isExpand': isExpand,
        'categoryId': categoryId,
      };


}
