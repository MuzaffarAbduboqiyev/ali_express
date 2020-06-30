//import 'dart:convert';
//
//import 'package:aliexpress/models/category_data.dart';
//import 'package:aliexpress/models/sub_category_data.dart';
//import 'package:aliexpress/models/tree_category_data.dart';
//import 'package:aliexpress/providers/product.dart';
//import 'package:sembast/sembast.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:path/path.dart';
//import 'package:http/http.dart' as http;
//import 'package:sembast/sembast_io.dart';
//import 'dart:async';
//
//class LocalDatabase {
//  LocalDatabase._();
//
//  static LocalDatabase get instance => LocalDatabase._();
//
////  final _categoryStore = intMapStoreFactory.store("categories");
////  final _subCategoryStore = intMapStoreFactory.store("subCategories");
////  final _treeCategoryStore = intMapStoreFactory.store("treeCategories");
////  final _productStore = intMapStoreFactory.store('products');
////
////  Completer<Database> _dbOpenCompleter;
////
////  Future<Database> get _database async {
////    return _dbOpenCompleter.future;
////  }
////
////  Future<void> init() async {
////    _insertData();
//////    if (_dbOpenCompleter == null) {
//////      _dbOpenCompleter = Completer();
//////      await _openDatabase();
//////      insertProducts();
//////    }
//////    final dir = await getApplicationDocumentsDirectory();
//////    final dbPath = join(dir.path, 'localDB.db');
//////    _database = await databaseFactoryIo.openDatabase(dbPath).then((value) {
//////      _insertData(value);
//////      return value;
//////    });
////  }
//
////  _openDatabase() async {
////    final appDocumentDir = await getApplicationDocumentsDirectory();
////    final dbPath = join(appDocumentDir.path, 'localDB.db');
////    final databases =
////        await databaseFactoryIo.openDatabase(dbPath).then((value) {
////      _insertData(value);
////      return value;
////    });
////    _dbOpenCompleter.complete(databases);
////  }
//
//  Future<List<Product>> getAllProducts() async {
//    List<Product> products = [];
////    final result = await _productStore.find(await _database);
////    result.map((productMap) {
////      products.add(Product.fromMap(productMap.key, productMap.value));
////      print("$productMap \n");
////    }).toList();
//    return products;
//  }
//
//  void _insertData() async {
//    List<CategoryData> _categoryData = [
//      CategoryData(
//          id: 0,
//          name: 'Popular Categories',
//          imageUrl: 'fiveHundredPx',
//          subCategories: [
//            SubCategoryData(
//                id: 100,
//                categoryId: 0,
//                name: 'Women\'s Glasses',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 200,
//                      subCategoryId: 100,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 201,
//                      subCategoryId: 100,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 202,
//                      subCategoryId: 100,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 203,
//                      subCategoryId: 100,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 204,
//                      subCategoryId: 100,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 205,
//                      subCategoryId: 100,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 206,
//                      subCategoryId: 100,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/506/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 101,
//                categoryId: 0,
//                name: 'Women\'s Hats',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 207,
//                      subCategoryId: 101,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 208,
//                      subCategoryId: 101,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 209,
//                      subCategoryId: 101,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 210,
//                      subCategoryId: 101,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 211,
//                      subCategoryId: 101,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 212,
//                      subCategoryId: 101,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 213,
//                      subCategoryId: 101,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/513/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 102,
//                categoryId: 0,
//                name: 'Women\'s Scarves',
//                isExpand: false),
//          ]),
//      CategoryData(
//          id: 1,
//          name: 'Apparel Accessories',
//          imageUrl: 'accessibleIcon',
//          subCategories: [
//            SubCategoryData(
//                id: 103,
//                categoryId: 1,
//                name: 'Women\'s Glasses',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 214,
//                      subCategoryId: 103,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/514/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 215,
//                      subCategoryId: 103,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/515/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 216,
//                      subCategoryId: 103,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/516/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 217,
//                      subCategoryId: 103,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/517/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 218,
//                      subCategoryId: 103,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/518/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 219,
//                      subCategoryId: 103,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/519/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 220,
//                      subCategoryId: 103,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/520/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 104,
//                categoryId: 1,
//                name: 'Women\'s Hats',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 221,
//                      subCategoryId: 104,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/521/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 222,
//                      subCategoryId: 104,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/522/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 223,
//                      subCategoryId: 104,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/523/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 224,
//                      subCategoryId: 104,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/524/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 225,
//                      subCategoryId: 104,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/525/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 226,
//                      subCategoryId: 104,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/526/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 227,
//                      subCategoryId: 104,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/527/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 105,
//                categoryId: 1,
//                name: 'Women\'s Scarves',
//                isExpand: false),
//          ]),
//      CategoryData(
//          id: 2,
//          name: 'Apparel for Men',
//          imageUrl: 'accusoft',
//          subCategories: [
//            SubCategoryData(
//                id: 106,
//                categoryId: 2,
//                name: 'Women\'s Glasses',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 228,
//                      subCategoryId: 106,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/528/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 229,
//                      subCategoryId: 106,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/529/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 230,
//                      subCategoryId: 106,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/530/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 231,
//                      subCategoryId: 106,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/531/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 232,
//                      subCategoryId: 106,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/532/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 233,
//                      subCategoryId: 106,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/533/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 234,
//                      subCategoryId: 106,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/534/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 107,
//                categoryId: 2,
//                name: 'Women\'s Hats',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 235,
//                      subCategoryId: 107,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/535/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 236,
//                      subCategoryId: 107,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/536/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 237,
//                      subCategoryId: 107,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/537/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 238,
//                      subCategoryId: 107,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/538/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 239,
//                      subCategoryId: 107,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/539/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 240,
//                      subCategoryId: 107,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/540/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 241,
//                      subCategoryId: 107,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/541/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 108,
//                categoryId: 2,
//                name: 'Women\'s Scarves',
//                isExpand: false),
//          ]),
//      CategoryData(
//          id: 3,
//          name: 'Apparel for Women',
//          imageUrl: 'acquisitionsIncorporated',
//          subCategories: [
//            SubCategoryData(
//                id: 100,
//                categoryId: 3,
//                name: 'Women\'s Glasses',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 200,
//                      subCategoryId: 100,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 201,
//                      subCategoryId: 100,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 202,
//                      subCategoryId: 100,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 203,
//                      subCategoryId: 100,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 204,
//                      subCategoryId: 100,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 205,
//                      subCategoryId: 100,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 206,
//                      subCategoryId: 100,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/506/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 101,
//                categoryId: 3,
//                name: 'Women\'s Hats',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 207,
//                      subCategoryId: 101,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 208,
//                      subCategoryId: 101,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 209,
//                      subCategoryId: 101,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 210,
//                      subCategoryId: 101,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 211,
//                      subCategoryId: 101,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 212,
//                      subCategoryId: 101,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 213,
//                      subCategoryId: 101,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/513/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 102,
//                categoryId: 3,
//                name: 'Women\'s Scarves',
//                isExpand: false),
//          ]),
//      CategoryData(
//          id: 4,
//          name: 'Popular Automobiles & Motorcycle',
//          imageUrl: 'ad',
//          subCategories: [
//            SubCategoryData(
//                id: 100,
//                categoryId: 4,
//                name: 'Women\'s Glasses',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 200,
//                      subCategoryId: 100,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 201,
//                      subCategoryId: 100,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 202,
//                      subCategoryId: 100,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 203,
//                      subCategoryId: 100,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 204,
//                      subCategoryId: 100,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 205,
//                      subCategoryId: 100,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 206,
//                      subCategoryId: 100,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://i.picsum.photos/id/506/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 101,
//                categoryId: 4,
//                name: 'Women\'s Hats',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 207,
//                      subCategoryId: 100,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 208,
//                      subCategoryId: 100,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 209,
//                      subCategoryId: 100,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 210,
//                      subCategoryId: 100,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 211,
//                      subCategoryId: 100,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 212,
//                      subCategoryId: 100,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 213,
//                      subCategoryId: 100,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://i.picsum.photos/id/513/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 102,
//                categoryId: 4,
//                name: 'Women\'s Scarves',
//                isExpand: false),
//          ]),
//      CategoryData(
//          id: 5,
//          name: 'Beauty & Health',
//          imageUrl: 'addressBook',
//          subCategories: [
//            SubCategoryData(
//                id: 100,
//                categoryId: 5,
//                name: 'Women\'s Glasses',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 200,
//                      subCategoryId: 100,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 201,
//                      subCategoryId: 100,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 202,
//                      subCategoryId: 100,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 203,
//                      subCategoryId: 100,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 204,
//                      subCategoryId: 100,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 205,
//                      subCategoryId: 100,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 206,
//                      subCategoryId: 100,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/506/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 101,
//                categoryId: 5,
//                name: 'Women\'s Hats',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 207,
//                      subCategoryId: 100,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 208,
//                      subCategoryId: 100,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 209,
//                      subCategoryId: 100,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 210,
//                      subCategoryId: 100,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 211,
//                      subCategoryId: 100,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 212,
//                      subCategoryId: 100,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 213,
//                      subCategoryId: 100,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/513/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 102,
//                categoryId: 5,
//                name: 'Women\'s Scarves',
//                isExpand: false),
//          ]),
//      CategoryData(
//          id: 6,
//          name: 'Cellphones & Telecommunication',
//          imageUrl: 'solidAddressBook',
//          subCategories: [
//            SubCategoryData(
//                id: 100,
//                categoryId: 6,
//                name: 'Women\'s Glasses',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 200,
//                      subCategoryId: 100,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 201,
//                      subCategoryId: 100,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 202,
//                      subCategoryId: 100,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 203,
//                      subCategoryId: 100,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 204,
//                      subCategoryId: 100,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 205,
//                      subCategoryId: 100,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 206,
//                      subCategoryId: 100,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/506/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 101,
//                categoryId: 6,
//                name: 'Women\'s Hats',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 207,
//                      subCategoryId: 100,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 208,
//                      subCategoryId: 100,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 209,
//                      subCategoryId: 100,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 210,
//                      subCategoryId: 100,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 211,
//                      subCategoryId: 100,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 212,
//                      subCategoryId: 100,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 213,
//                      subCategoryId: 100,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/513/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 102,
//                categoryId: 6,
//                name: 'Women\'s Scarves',
//                isExpand: false),
//          ]),
//      CategoryData(
//          id: 7,
//          name: 'Computer & Office',
//          imageUrl: 'addressCard',
//          subCategories: [
//            SubCategoryData(
//                id: 100,
//                categoryId: 7,
//                name: 'Women\'s Glasses',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 200,
//                      subCategoryId: 100,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 201,
//                      subCategoryId: 100,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 202,
//                      subCategoryId: 100,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 203,
//                      subCategoryId: 100,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 204,
//                      subCategoryId: 100,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 205,
//                      subCategoryId: 100,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 206,
//                      subCategoryId: 100,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/506/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 101,
//                categoryId: 7,
//                name: 'Women\'s Hats',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 207,
//                      subCategoryId: 100,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 208,
//                      subCategoryId: 100,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 209,
//                      subCategoryId: 100,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 210,
//                      subCategoryId: 100,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 211,
//                      subCategoryId: 100,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 212,
//                      subCategoryId: 100,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 213,
//                      subCategoryId: 100,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/513/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 102,
//                categoryId: 7,
//                name: 'Women\'s Scarves',
//                isExpand: false),
//          ]),
//      CategoryData(
//          id: 8,
//          name: 'Consumer Electronics',
//          imageUrl: 'solidAddressCard',
//          subCategories: [
//            SubCategoryData(
//                id: 100,
//                categoryId: 8,
//                name: 'Women\'s Glasses',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 200,
//                      subCategoryId: 100,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 201,
//                      subCategoryId: 100,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 202,
//                      subCategoryId: 100,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 203,
//                      subCategoryId: 100,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 204,
//                      subCategoryId: 100,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 205,
//                      subCategoryId: 100,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 206,
//                      subCategoryId: 100,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/506/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 101,
//                categoryId: 8,
//                name: 'Women\'s Hats',
//                isExpand: true,
//                treeCategories: [
//                  TreeCategoryData(
//                      id: 207,
//                      subCategoryId: 100,
//                      name: 'Calligraphy Brushes',
//                      imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 208,
//                      subCategoryId: 100,
//                      name: 'Ballpoint Pens',
//                      imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 209,
//                      subCategoryId: 100,
//                      name: 'Crayons',
//                      imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 210,
//                      subCategoryId: 100,
//                      name: 'Banner Pens',
//                      imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 211,
//                      subCategoryId: 100,
//                      name: 'Oil Pastel',
//                      imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 212,
//                      subCategoryId: 100,
//                      name: 'Correction Supplies',
//                      imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
//                  TreeCategoryData(
//                      id: 213,
//                      subCategoryId: 100,
//                      name: 'Fountain Pens',
//                      imageUrl: "https://picsum.photos/id/513/200/300.jpg"),
//                ]),
//            SubCategoryData(
//                id: 102,
//                categoryId: 8,
//                name: 'Women\'s Scarves',
//                isExpand: false),
//          ]),
//    ];
//
//    List<Product> _products = [];
//    int j = 0;
//    for (int i = 200; i <= 241; i++) {
//      for (int k = 0; k < 10; k++) {
//        _products.add(Product(
//            id: j,
//            categoryId: i,
//            title:
//                "Luxury quality 777 Mixed colors Business Office Fountain Pen student",
//            description: "",
//            descriptionImages: [
//              "https://picsum.photos/id/${i + k + j + 1}/200/300.jpg",
//              "https://picsum.photos/id/${i + k + j + 2}/200/300.jpg",
//              "https://picsum.photos/id/${i + k + j + 3}/200/300.jpg",
//              "https://picsum.photos/id/${j + 4}/200/300.jpg",
//              "https://picsum.photos/id/${j + 5}/200/300.jpg",
//              "https://picsum.photos/id/${j + 7}/200/300.jpg"
//            ],
//            oldPrice: "0.99 - 1.29",
//            newPrice: "0.73-0.95",
//            images: [
//              "https://picsum.photos/id/${j + 8}/200/300.jpg",
//              "https://picsum.photos/id/${j + 9}/200/300.jpg",
//              "https://picsum.photos/id/${j + 10}/200/300.jpg",
//              "https://picsum.photos/id/${j + 11}/200/300.jpg",
//              "https://picsum.photos/id/${j + 12}/200/300.jpg",
//              "https://picsum.photos/id/${j + 13}/200/300.jpg"
//            ],
//            rate: 5.0,
//            sale: 26,
//            favoriteCount: 940,
//            ordersCount: 597));
//        j++;
//      }
//    }
//
//    for (int i = 102; i <= 108; i = i + 3) {
//      _products.add(Product(
//          id: j,
//          categoryId: i,
//          title:
//              "Luxury quality 777 Mixed colors Business Office Fountain Pen student",
//          description: "",
//          descriptionImages: [
//            "https://picsum.photos/id/${i + j + 1}/200/300.jpg",
//            "https://picsum.photos/id/${i + j + 2}/200/300.jpg",
//            "https://picsum.photos/id/${i + j + 3}/200/300.jpg",
//            "https://picsum.photos/id/${j + 4}/200/300.jpg",
//            "https://picsum.photos/id/${j + 5}/200/300.jpg",
//            "https://picsum.photos/id/${j + 7}/200/300.jpg"
//          ],
//          oldPrice: "0.99 - 1.29",
//          newPrice: "0.73-0.95",
//          images: [
//            "https://picsum.photos/id/${j + 8}/200/300.jpg",
//            "https://picsum.photos/id/${j + 9}/200/300.jpg",
//            "https://picsum.photos/id/${j + 10}/200/300.jpg",
//            "https://picsum.photos/id/${j + 11}/200/300.jpg",
//            "https://picsum.photos/id/${j + 12}/200/300.jpg",
//            "https://picsum.photos/id/${j + 13}/200/300.jpg"
//          ],
//          rate: 5.0,
//          sale: 26,
//          favoriteCount: 940,
//          ordersCount: 597));
//      j++;
//    }
//
//    List<Map<String, dynamic>> mapCategories = [];
//    _categoryData.map((e){
//      mapCategories.add(e.toMap());
//    }).toList();
//
//    List<Map<String, dynamic>> mapProducts = [];
//    _products.map((e) => mapProducts.add(e.toMap())).toList();
//
//    final String urlProduct = 'https://flutterexpressshop.firebaseio.com/products.json';
//    final response = await http.post(urlProduct, body: json.encode(mapProducts));
//    final String urlCategory = 'https://flutterexpressshop.firebaseio.com/categories.json';
//    final responseCategory = await http.post(urlCategory, body: json.encode(mapCategories));
//
//
////    List<Map<String, dynamic>> mapSubCategories = [];
////    List<Map<String, dynamic>> mapTreeCategories = [];
////    List<Map<String, dynamic>> mapProducts = [];
////    _categoryData.map((e) {
////      e.subCategories.map((f) {
////        if(f.isExpand){
////        f.treeCategories.map((g) {
////          mapTreeCategories.add(g.toMap());
////        }).toList();
////        }
////        mapSubCategories.add(f.toMap());
////      }).toList();
////      mapCategories.add(e.toMap());
////    }).toList();
////
////    _products.map((e) => mapProducts.add(e.toMap())).toList();
////
////     await _database.then((value) => value.transaction((transaction) async {
////      await _productStore.addAll(transaction, mapProducts);
////      await _categoryStore.addAll(transaction, mapCategories);
////      await _subCategoryStore.addAll(transaction, mapSubCategories);
////      await _treeCategoryStore.addAll(transaction, mapTreeCategories);
////    }));
//
//  }
//}
