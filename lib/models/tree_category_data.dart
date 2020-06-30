import 'package:flutter/foundation.dart';

class TreeCategoryData {
  final int id;
  final int subCategoryId;
  final String name;
  final String imageUrl;

  TreeCategoryData(
      {@required this.id,
      @required this.subCategoryId,
      @required this.name,
      @required this.imageUrl});

  factory TreeCategoryData.fromMap(Map<String, dynamic> data) =>
      TreeCategoryData(
          id: data['id'],
          name: data['name'],
          subCategoryId: data['subCategoryId'],
          imageUrl: data['imageUrl']);

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'subCategoryId': subCategoryId,
        'imageUrl': imageUrl
      };
}
