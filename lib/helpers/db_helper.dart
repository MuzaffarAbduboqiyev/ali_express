//import 'dart:io';
//
//import 'package:sqflite/sqflite.dart';
//import 'package:path/path.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:aliexpress/providers/product.dart';
//
//class DBHelper {
//  DBHelper._();
////
////  static Database _database;
////  static const String productsTable = "productTable";
////  static const String imagesTable = "imageTable";
////
////  static Future<Database> get database async {
////    print("databse");
////    if (_database != null) return _database;
////    _database = await _initDB();
//////    insertData();
////    return _database;
////  }
////
////  static _initDB() async {
////    final databasePath = await getApplicationDocumentsDirectory();
////    String path = join(databasePath.path, "products.db");
////    print("_initDB()");
////    return await openDatabase(path, version: 1, onCreate: _onCreate);
////  }
////
////  static Future<void> _onCreate(Database db, int version) async {
//////    List<Map<String, Object>> _images = [];
////    print("_onCreate()");
////    await db.execute(
////        "create table $productsTable(id integer primary key, title text, description text, oldPrice text, newPrice text, rate real, freeReturn integer, sale integer, favoriteCount integer, isFavorite integer, ordersCount integer)").then((value) => print("productTable DONE"));
////    await db.execute(
////    "create table $imagesTable(id integer primary key autoincrement, imageUrl TEXT, productId INTEGER, isDescription INTEGER)").then((value) => print("imagerTable DONE"));
////
//////    List<Product> _items = [
//////      Product(
//////          id: 0,
//////          title:
//////          "Luxury quality 777 Mixed colors Business Office Fountain Pen student jkshfjkdshljfhsdjfhdsljhfkjshdjfklhasjklfhskljhfjaskldhfdasjklfhjdskhfjksdhaflasdjkfhjasklfhjadskl",
//////          description: "",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/110/200/300.jpg",
//////            "https://i.picsum.photos/id/111/200/300.jpg",
//////            "https://i.picsum.photos/id/112/200/300.jpg",
//////            "https://i.picsum.photos/id/113/200/300.jpg",
//////            "https://i.picsum.photos/id/114/200/300.jpg",
//////            "https://i.picsum.photos/id/115/200/300.jpg"
//////          ],
//////          oldPrice: "0.99 - 1.29",
//////          newPrice: "0.73-0.95",
//////          images: [
//////            "https://i.picsum.photos/id/0/200/300.jpg",
//////            "https://i.picsum.photos/id/1/200/300.jpg",
//////            "https://i.picsum.photos/id/2/200/300.jpg",
//////            "https://i.picsum.photos/id/3/200/300.jpg",
//////            "https://i.picsum.photos/id/4/200/300.jpg",
//////            "https://i.picsum.photos/id/5/200/300.jpg"
//////          ],
//////          rate: 2.5,
//////          sale: 26,
//////          favoriteCount: 940,
//////          ordersCount: 597),
//////      Product(
//////          id: 1,
//////          title:
//////          "New listing High quality 405 Various colors Nib school Student office stationers Fountain Pen",
//////          description: "",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/12/200/300.jpg",
//////            "https://i.picsum.photos/id/13/200/300.jpg",
//////            "https://i.picsum.photos/id/12/200/300.jpg",
//////            "https://i.picsum.photos/id/13/200/300.jpg",
//////            "https://i.picsum.photos/id/14/200/300.jpg",
//////            "https://i.picsum.photos/id/15/200/300.jpg"
//////          ],
//////          oldPrice: "0.99 - 1.99",
//////          newPrice: "0.76 - 1.53",
//////          images: [
//////            "https://i.picsum.photos/id/6/200/300.jpg",
//////            "https://i.picsum.photos/id/7/200/300.jpg",
//////            "https://i.picsum.photos/id/8/200/300.jpg",
//////            "https://i.picsum.photos/id/9/200/300.jpg",
//////            "https://i.picsum.photos/id/10/200/300.jpg",
//////            "https://i.picsum.photos/id/11/200/300.jpg"
//////          ],
//////          rate: 3.8,
//////          sale: 23,
//////          favoriteCount: 1025,
//////          ordersCount: 4737),
//////      Product(
//////          id: 2,
//////          title:
//////          "MIYA 18 colors Couache Paint Set 30 ml Portable Case with Palette Couache",
//////          description: "",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/16/200/300.jpg",
//////            "https://i.picsum.photos/id/17/200/300.jpg",
//////            "https://i.picsum.photos/id/18/200/300.jpg",
//////            "https://i.picsum.photos/id/19/200/300.jpg",
//////            "https://i.picsum.photos/id/20/200/300.jpg",
//////            "https://i.picsum.photos/id/21/200/300.jpg"
//////          ],
//////          oldPrice: "28.99 - 42.99",
//////          newPrice: "22.90 - 33.96",
//////          images: [
//////            "https://i.picsum.photos/id/22/200/300.jpg",
//////            "https://i.picsum.photos/id/23/200/300.jpg",
//////            "https://i.picsum.photos/id/24/200/300.jpg",
//////            "https://i.picsum.photos/id/25/200/300.jpg",
//////            "https://i.picsum.photos/id/26/200/300.jpg",
//////            "https://i.picsum.photos/id/27/200/300.jpg"
//////          ],
//////          freeReturn: true,
//////          rate: 1.2,
//////          sale: 21,
//////          favoriteCount: 6012,
//////          ordersCount: 751),
//////      Product(
//////          id: 3,
//////          title: "3 Pieces Of Nylon Plastic Water Container",
//////          description: "",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/30/200/300.jpg",
//////            "https://i.picsum.photos/id/31/200/300.jpg",
//////            "https://i.picsum.photos/id/32/200/300.jpg",
//////            "https://i.picsum.photos/id/33/200/300.jpg",
//////            "https://i.picsum.photos/id/34/200/300.jpg",
//////            "https://i.picsum.photos/id/35/200/300.jpg"
//////          ],
//////          oldPrice: "2.50 / lot",
//////          newPrice: "1.97 / lot",
//////          images: [
//////            "https://i.picsum.photos/id/36/200/300.jpg",
//////            "https://i.picsum.photos/id/37/200/300.jpg",
//////            "https://i.picsum.photos/id/38/200/300.jpg",
//////            "https://i.picsum.photos/id/39/200/300.jpg",
//////            "https://i.picsum.photos/id/40/200/300.jpg",
//////            "https://i.picsum.photos/id/41/200/300.jpg"
//////          ],
//////          rate: 3.9,
//////          sale: 21,
//////          favoriteCount: 2343,
//////          ordersCount: 276),
//////      Product(
//////          id: 4,
//////          title: "Casual Women Watches Starry Sky Quartz",
//////          description:
//////          "Casual Women Watches Starry Sky Quartz Wristwatch Female Clock\nItem Type: Ladies Quartz Wrist Watches\nDial Diametr: 32mm\nStyle: Fashion, Casual, Simple, Creative",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/50/200/300.jpg",
//////            "https://i.picsum.photos/id/51/200/300.jpg",
//////            "https://i.picsum.photos/id/52/200/300.jpg",
//////            "https://i.picsum.photos/id/53/200/300.jpg",
//////            "https://i.picsum.photos/id/54/200/300.jpg",
//////            "https://i.picsum.photos/id/55/200/300.jpg"
//////          ],
//////          oldPrice: "2.44 - 2.54",
//////          newPrice: "4.78 - 4.98",
//////          images: [
//////            "https://i.picsum.photos/id/56/200/300.jpg",
//////            "https://i.picsum.photos/id/57/200/300.jpg",
//////            "https://i.picsum.photos/id/58/200/300.jpg",
//////            "https://i.picsum.photos/id/59/200/300.jpg",
//////            "https://i.picsum.photos/id/60/200/300.jpg",
//////            "https://i.picsum.photos/id/49/200/300.jpg"
//////          ],
//////          freeReturn: true,
//////          rate: 0,
//////          sale: 49,
//////          favoriteCount: 165,
//////          ordersCount: 144),
//////      Product(
//////          id: 5,
//////          title: "Fashion Sport Watch LED Luxury Man Digital Military Army",
//////          description: "",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/60/200/300.jpg",
//////            "https://i.picsum.photos/id/61/200/300.jpg",
//////            "https://i.picsum.photos/id/62/200/300.jpg",
//////            "https://i.picsum.photos/id/63/200/300.jpg",
//////            "https://i.picsum.photos/id/64/200/300.jpg",
//////            "https://i.picsum.photos/id/65/200/300.jpg"
//////          ],
//////          oldPrice: "0.01",
//////          newPrice: "29.80 - 33.90",
//////          images: [
//////            "https://i.picsum.photos/id/66/200/300.jpg",
//////            "https://i.picsum.photos/id/67/200/300.jpg",
//////            "https://i.picsum.photos/id/68/200/300.jpg",
//////            "https://i.picsum.photos/id/69/200/300.jpg",
//////            "https://i.picsum.photos/id/70/200/300.jpg",
//////            "https://i.picsum.photos/id/48/200/300.jpg"
//////          ],
//////          rate: 5.0,
//////          sale: 26,
//////          favoriteCount: 940,
//////          ordersCount: 597),
//////      Product(
//////          id: 6,
//////          title: "2020 Minimalist Men's Fashion Ultra Thin Watches",
//////          description:
//////          "Feature:100% brand new and high quality\nGender: Men\nStyle Casual",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/80/200/300.jpg",
//////            "https://i.picsum.photos/id/81/200/300.jpg",
//////            "https://i.picsum.photos/id/82/200/300.jpg",
//////            "https://i.picsum.photos/id/83/200/300.jpg",
//////            "https://i.picsum.photos/id/84/200/300.jpg",
//////            "https://i.picsum.photos/id/85/200/300.jpg"
//////          ],
//////          oldPrice: "0.99 - 1.29",
//////          newPrice: "0.73-0.95",
//////          images: [
//////            "https://i.picsum.photos/id/90/200/300.jpg",
//////            "https://i.picsum.photos/id/91/200/300.jpg",
//////            "https://i.picsum.photos/id/92/200/300.jpg",
//////            "https://i.picsum.photos/id/93/200/300.jpg",
//////            "https://i.picsum.photos/id/94/200/300.jpg",
//////            "https://i.picsum.photos/id/95/200/300.jpg"
//////          ],
//////          freeReturn: true,
//////          rate: 4.3,
//////          sale: 0,
//////          favoriteCount: 10035,
//////          ordersCount: 19993),
//////      Product(
//////          id: 7,
//////          title: "20mm Small Glass Cork Bottle Empty Glass Box",
//////          description:
//////          "Type: Empty Bottles\nColor: Transparent\nMaterial: Glass\nShape: Geometric\n\nSize: W*L\nStar: 22*26mm",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/100/200/300.jpg",
//////            "https://i.picsum.photos/id/101/200/300.jpg",
//////            "https://i.picsum.photos/id/102/200/300.jpg",
//////            "https://i.picsum.photos/id/103/200/300.jpg",
//////            "https://i.picsum.photos/id/104/200/300.jpg",
//////            "https://i.picsum.photos/id/105/200/300.jpg"
//////          ],
//////          oldPrice: "0.59 - 1.93",
//////          newPrice: "0.42 - 0.93",
//////          images: [
//////            "https://i.picsum.photos/id/100/200/300.jpg",
//////            "https://i.picsum.photos/id/101/200/300.jpg",
//////            "https://i.picsum.photos/id/102/200/300.jpg",
//////            "https://i.picsum.photos/id/103/200/300.jpg",
//////            "https://i.picsum.photos/id/104/200/300.jpg",
//////            "https://i.picsum.photos/id/105/200/300.jpg"
//////          ],
//////          rate: 2.8,
//////          sale: 28,
//////          favoriteCount: 289,
//////          ordersCount: 53),
//////      Product(
//////          id: 8,
//////          title:
//////          "Luxury quality 777 Mixed colors Business Office Fountain Pen student",
//////          description: "",
//////          descriptionImages:  [
//////            "https://i.picsum.photos/id/0/200/300.jpg",
//////            "https://i.picsum.photos/id/1/200/300.jpg",
//////            "https://i.picsum.photos/id/2/200/300.jpg",
//////            "https://i.picsum.photos/id/3/200/300.jpg",
//////            "https://i.picsum.photos/id/4/200/300.jpg",
//////            "https://i.picsum.photos/id/5/200/300.jpg"
//////          ],
//////          oldPrice: "0.99 - 1.29",
//////          newPrice: "0.73-0.95",
//////          images: [
//////            "https://i.picsum.photos/id/0/200/300.jpg",
//////            "https://i.picsum.photos/id/1/200/300.jpg",
//////            "https://i.picsum.photos/id/2/200/300.jpg",
//////            "https://i.picsum.photos/id/3/200/300.jpg",
//////            "https://i.picsum.photos/id/4/200/300.jpg",
//////            "https://i.picsum.photos/id/5/200/300.jpg"
//////          ],
//////          freeReturn: true,
//////          rate: 5.0,
//////          sale: 26,
//////          favoriteCount: 940,
//////          ordersCount: 597),
//////      Product(
//////          id: 9,
//////          title:
//////          "Luxury quality 777 Mixed colors Business Office Fountain Pen student",
//////          description: "",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/110/200/300.jpg",
//////            "https://i.picsum.photos/id/111/200/300.jpg",
//////            "https://i.picsum.photos/id/112/200/300.jpg",
//////            "https://i.picsum.photos/id/113/200/300.jpg",
//////            "https://i.picsum.photos/id/114/200/300.jpg",
//////            "https://i.picsum.photos/id/115/200/300.jpg"
//////          ],
//////          oldPrice: "0.99 - 1.29",
//////          newPrice: "0.73-0.95",
//////          images: [
//////            "https://i.picsum.photos/id/0/200/300.jpg",
//////            "https://i.picsum.photos/id/1/200/300.jpg",
//////            "https://i.picsum.photos/id/2/200/300.jpg",
//////            "https://i.picsum.photos/id/3/200/300.jpg",
//////            "https://i.picsum.photos/id/4/200/300.jpg",
//////            "https://i.picsum.photos/id/5/200/300.jpg"
//////          ],
//////          rate: 5.0,
//////          sale: 26,
//////          favoriteCount: 940,
//////          ordersCount: 597),
//////      Product(
//////          id: 10,
//////          title: "20mm Small Glass Cork Bottle Empty Glass Box",
//////          description:
//////          "Type: Empty Bottles\nColor: Transparent\nMaterial: Glass\nShape: Geometric\n\nSize: W*L\nStar: 22*26mm",
//////          oldPrice: "0.59 - 1.93",
//////          newPrice: "0.42 - 0.93",
//////          freeReturn: true,
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/110/200/300.jpg",
//////            "https://i.picsum.photos/id/111/200/300.jpg",
//////            "https://i.picsum.photos/id/112/200/300.jpg",
//////            "https://i.picsum.photos/id/113/200/300.jpg",
//////            "https://i.picsum.photos/id/114/200/300.jpg",
//////            "https://i.picsum.photos/id/115/200/300.jpg"
//////          ],
//////          images: [
//////            "https://i.picsum.photos/id/100/200/300.jpg",
//////            "https://i.picsum.photos/id/101/200/300.jpg",
//////            "https://i.picsum.photos/id/102/200/300.jpg",
//////            "https://i.picsum.photos/id/103/200/300.jpg",
//////            "https://i.picsum.photos/id/104/200/300.jpg",
//////            "https://i.picsum.photos/id/105/200/300.jpg"
//////          ],
//////          rate: 2.8,
//////          sale: 28,
//////          favoriteCount: 289,
//////          ordersCount: 53),
//////    ];
////    print("insertData()");
////    await db.transaction((txn) async{
////      print("_transaction");
//////      await txn.execute(
//////        "create table $imagesTable (id integer primary key autoincrement, imageUrl TEXT, productId INTEGER, isDescription INTEGER)",);
//////      await txn.execute(
//////          "create table $productsTable (id text primary key, title text, description text, oldPrice text, newPrice text, rate real, freeReturn integer, sale integer, favoriteCount integer, isFavorite integer, ordersCount integer)");
//////      var batch = txn.batch();
////      List<Map<String, Object>> products = [];
////      List<Map<String, Object>> images = [];
////      List<Product> _items = [];
////      _items.map((prod) {
////        print("prodId: ${prod.id}");
////        prod.descriptionImages.map((imgUrl){
////          print("imgUrl: $imgUrl");
////
//////          batch.insert(imagesTable,
//////              {'imageUrl': imgUrl, 'productId': prod.id, 'isDescription': 1});
////        images.add({'imageUrl': imgUrl, 'productId': prod.id, 'isDescription': 1});
////        });
////        prod.images.map((imgUrl){
//////          batch.insert(imagesTable,
//////              {'imageUrl': imgUrl, 'productId': prod.id, 'isDescription': 0});
////        images.add({'imageUrl': imgUrl, 'productId': prod.id, 'isDescription': 0});
////        });
//////        batch.insert(productsTable, prod.toMap());
////      products.add(prod.toMap());
////      });
////      var batch = txn.batch();
////      batch.rawInsert(imagesTable, images);
////      batch.rawInsert(productsTable, products);
////      await batch.commit(noResult: true, continueOnError: true);
////    });
////  }
////
//////
////
////  static Future<List<Product>> getData() async {
////    final db = await database;
////    List<Map<String, Object>> result =
////        await db.query(productsTable);
////    List<Map<String, Object>> imageResult =
////        await db.query(imagesTable);
////    List<Product> products = [];
////    result.map((prodData) {
////      List<String> descriptionImages = [];
////      List<String> productImages = [];
////      imageResult.map((imgUrl) {
////        if (imgUrl['productId'].toString().compareTo(prodData['id'].toString()) == 0) {
////          if (imgUrl['isDescription'].toString().compareTo("1") == 0) {
////            descriptionImages.add(imgUrl['imageUrl']);
////          } else {
////            productImages.add(imgUrl['imageUrl']);
////          }
////        }
////      });
//////      products.add(Product.fromMap(prodData, descriptionImages, productImages));
////    });
////    print("getData() = ${products.length}");
////    return products;
////  }
////
////  static Future<void> insertData() async{
//////    List<Product> _items = [
//////      Product(
//////          id: 0,
//////          title:
//////          "Luxury quality 777 Mixed colors Business Office Fountain Pen student jkshfjkdshljfhsdjfhdsljhfkjshdjfklhasjklfhskljhfjaskldhfdasjklfhjdskhfjksdhaflasdjkfhjasklfhjadskl",
//////          description: "",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/110/200/300.jpg",
//////            "https://i.picsum.photos/id/111/200/300.jpg",
//////            "https://i.picsum.photos/id/112/200/300.jpg",
//////            "https://i.picsum.photos/id/113/200/300.jpg",
//////            "https://i.picsum.photos/id/114/200/300.jpg",
//////            "https://i.picsum.photos/id/115/200/300.jpg"
//////          ],
//////          oldPrice: "0.99 - 1.29",
//////          newPrice: "0.73-0.95",
//////          images: [
//////            "https://i.picsum.photos/id/0/200/300.jpg",
//////            "https://i.picsum.photos/id/1/200/300.jpg",
//////            "https://i.picsum.photos/id/2/200/300.jpg",
//////            "https://i.picsum.photos/id/3/200/300.jpg",
//////            "https://i.picsum.photos/id/4/200/300.jpg",
//////            "https://i.picsum.photos/id/5/200/300.jpg"
//////          ],
//////          rate: 2.5,
//////          sale: 26,
//////          favoriteCount: 940,
//////          ordersCount: 597),
//////      Product(
//////          id: 1,
//////          title:
//////          "New listing High quality 405 Various colors Nib school Student office stationers Fountain Pen",
//////          description: "",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/12/200/300.jpg",
//////            "https://i.picsum.photos/id/13/200/300.jpg",
//////            "https://i.picsum.photos/id/12/200/300.jpg",
//////            "https://i.picsum.photos/id/13/200/300.jpg",
//////            "https://i.picsum.photos/id/14/200/300.jpg",
//////            "https://i.picsum.photos/id/15/200/300.jpg"
//////          ],
//////          oldPrice: "0.99 - 1.99",
//////          newPrice: "0.76 - 1.53",
//////          images: [
//////            "https://i.picsum.photos/id/6/200/300.jpg",
//////            "https://i.picsum.photos/id/7/200/300.jpg",
//////            "https://i.picsum.photos/id/8/200/300.jpg",
//////            "https://i.picsum.photos/id/9/200/300.jpg",
//////            "https://i.picsum.photos/id/10/200/300.jpg",
//////            "https://i.picsum.photos/id/11/200/300.jpg"
//////          ],
//////          rate: 3.8,
//////          sale: 23,
//////          favoriteCount: 1025,
//////          ordersCount: 4737),
//////      Product(
//////          id: 2,
//////          title:
//////          "MIYA 18 colors Couache Paint Set 30 ml Portable Case with Palette Couache",
//////          description: "",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/16/200/300.jpg",
//////            "https://i.picsum.photos/id/17/200/300.jpg",
//////            "https://i.picsum.photos/id/18/200/300.jpg",
//////            "https://i.picsum.photos/id/19/200/300.jpg",
//////            "https://i.picsum.photos/id/20/200/300.jpg",
//////            "https://i.picsum.photos/id/21/200/300.jpg"
//////          ],
//////          oldPrice: "28.99 - 42.99",
//////          newPrice: "22.90 - 33.96",
//////          images: [
//////            "https://i.picsum.photos/id/22/200/300.jpg",
//////            "https://i.picsum.photos/id/23/200/300.jpg",
//////            "https://i.picsum.photos/id/24/200/300.jpg",
//////            "https://i.picsum.photos/id/25/200/300.jpg",
//////            "https://i.picsum.photos/id/26/200/300.jpg",
//////            "https://i.picsum.photos/id/27/200/300.jpg"
//////          ],
//////          freeReturn: true,
//////          rate: 1.2,
//////          sale: 21,
//////          favoriteCount: 6012,
//////          ordersCount: 751),
//////      Product(
//////          id: 3,
//////          title: "3 Pieces Of Nylon Plastic Water Container",
//////          description: "",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/30/200/300.jpg",
//////            "https://i.picsum.photos/id/31/200/300.jpg",
//////            "https://i.picsum.photos/id/32/200/300.jpg",
//////            "https://i.picsum.photos/id/33/200/300.jpg",
//////            "https://i.picsum.photos/id/34/200/300.jpg",
//////            "https://i.picsum.photos/id/35/200/300.jpg"
//////          ],
//////          oldPrice: "2.50 / lot",
//////          newPrice: "1.97 / lot",
//////          images: [
//////            "https://i.picsum.photos/id/36/200/300.jpg",
//////            "https://i.picsum.photos/id/37/200/300.jpg",
//////            "https://i.picsum.photos/id/38/200/300.jpg",
//////            "https://i.picsum.photos/id/39/200/300.jpg",
//////            "https://i.picsum.photos/id/40/200/300.jpg",
//////            "https://i.picsum.photos/id/41/200/300.jpg"
//////          ],
//////          rate: 3.9,
//////          sale: 21,
//////          favoriteCount: 2343,
//////          ordersCount: 276),
//////      Product(
//////          id: 4,
//////          title: "Casual Women Watches Starry Sky Quartz",
//////          description:
//////          "Casual Women Watches Starry Sky Quartz Wristwatch Female Clock\nItem Type: Ladies Quartz Wrist Watches\nDial Diametr: 32mm\nStyle: Fashion, Casual, Simple, Creative",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/50/200/300.jpg",
//////            "https://i.picsum.photos/id/51/200/300.jpg",
//////            "https://i.picsum.photos/id/52/200/300.jpg",
//////            "https://i.picsum.photos/id/53/200/300.jpg",
//////            "https://i.picsum.photos/id/54/200/300.jpg",
//////            "https://i.picsum.photos/id/55/200/300.jpg"
//////          ],
//////          oldPrice: "2.44 - 2.54",
//////          newPrice: "4.78 - 4.98",
//////          images: [
//////            "https://i.picsum.photos/id/56/200/300.jpg",
//////            "https://i.picsum.photos/id/57/200/300.jpg",
//////            "https://i.picsum.photos/id/58/200/300.jpg",
//////            "https://i.picsum.photos/id/59/200/300.jpg",
//////            "https://i.picsum.photos/id/60/200/300.jpg",
//////            "https://i.picsum.photos/id/49/200/300.jpg"
//////          ],
//////          freeReturn: true,
//////          rate: 0,
//////          sale: 49,
//////          favoriteCount: 165,
//////          ordersCount: 144),
//////      Product(
//////          id: 5,
//////          title: "Fashion Sport Watch LED Luxury Man Digital Military Army",
//////          description: "",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/60/200/300.jpg",
//////            "https://i.picsum.photos/id/61/200/300.jpg",
//////            "https://i.picsum.photos/id/62/200/300.jpg",
//////            "https://i.picsum.photos/id/63/200/300.jpg",
//////            "https://i.picsum.photos/id/64/200/300.jpg",
//////            "https://i.picsum.photos/id/65/200/300.jpg"
//////          ],
//////          oldPrice: "0.01",
//////          newPrice: "29.80 - 33.90",
//////          images: [
//////            "https://i.picsum.photos/id/66/200/300.jpg",
//////            "https://i.picsum.photos/id/67/200/300.jpg",
//////            "https://i.picsum.photos/id/68/200/300.jpg",
//////            "https://i.picsum.photos/id/69/200/300.jpg",
//////            "https://i.picsum.photos/id/70/200/300.jpg",
//////            "https://i.picsum.photos/id/48/200/300.jpg"
//////          ],
//////          rate: 5.0,
//////          sale: 26,
//////          favoriteCount: 940,
//////          ordersCount: 597),
//////      Product(
//////          id: 6,
//////          title: "2020 Minimalist Men's Fashion Ultra Thin Watches",
//////          description:
//////          "Feature:100% brand new and high quality\nGender: Men\nStyle Casual",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/80/200/300.jpg",
//////            "https://i.picsum.photos/id/81/200/300.jpg",
//////            "https://i.picsum.photos/id/82/200/300.jpg",
//////            "https://i.picsum.photos/id/83/200/300.jpg",
//////            "https://i.picsum.photos/id/84/200/300.jpg",
//////            "https://i.picsum.photos/id/85/200/300.jpg"
//////          ],
//////          oldPrice: "0.99 - 1.29",
//////          newPrice: "0.73-0.95",
//////          images: [
//////            "https://i.picsum.photos/id/90/200/300.jpg",
//////            "https://i.picsum.photos/id/91/200/300.jpg",
//////            "https://i.picsum.photos/id/92/200/300.jpg",
//////            "https://i.picsum.photos/id/93/200/300.jpg",
//////            "https://i.picsum.photos/id/94/200/300.jpg",
//////            "https://i.picsum.photos/id/95/200/300.jpg"
//////          ],
//////          freeReturn: true,
//////          rate: 4.3,
//////          sale: 0,
//////          favoriteCount: 10035,
//////          ordersCount: 19993),
//////      Product(
//////          id: 7,
//////          title: "20mm Small Glass Cork Bottle Empty Glass Box",
//////          description:
//////          "Type: Empty Bottles\nColor: Transparent\nMaterial: Glass\nShape: Geometric\n\nSize: W*L\nStar: 22*26mm",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/100/200/300.jpg",
//////            "https://i.picsum.photos/id/101/200/300.jpg",
//////            "https://i.picsum.photos/id/102/200/300.jpg",
//////            "https://i.picsum.photos/id/103/200/300.jpg",
//////            "https://i.picsum.photos/id/104/200/300.jpg",
//////            "https://i.picsum.photos/id/105/200/300.jpg"
//////          ],
//////          oldPrice: "0.59 - 1.93",
//////          newPrice: "0.42 - 0.93",
//////          images: [
//////            "https://i.picsum.photos/id/100/200/300.jpg",
//////            "https://i.picsum.photos/id/101/200/300.jpg",
//////            "https://i.picsum.photos/id/102/200/300.jpg",
//////            "https://i.picsum.photos/id/103/200/300.jpg",
//////            "https://i.picsum.photos/id/104/200/300.jpg",
//////            "https://i.picsum.photos/id/105/200/300.jpg"
//////          ],
//////          rate: 2.8,
//////          sale: 28,
//////          favoriteCount: 289,
//////          ordersCount: 53),
//////      Product(
//////          id: 8,
//////          title:
//////          "Luxury quality 777 Mixed colors Business Office Fountain Pen student",
//////          description: "",
//////          oldPrice: "0.99 - 1.29",
//////          newPrice: "0.73-0.95",
//////          images: [
//////            "https://i.picsum.photos/id/0/200/300.jpg",
//////            "https://i.picsum.photos/id/1/200/300.jpg",
//////            "https://i.picsum.photos/id/2/200/300.jpg",
//////            "https://i.picsum.photos/id/3/200/300.jpg",
//////            "https://i.picsum.photos/id/4/200/300.jpg",
//////            "https://i.picsum.photos/id/5/200/300.jpg"
//////          ],
//////          freeReturn: true,
//////          rate: 5.0,
//////          sale: 26,
//////          favoriteCount: 940,
//////          ordersCount: 597),
//////      Product(
//////          id: 9,
//////          title:
//////          "Luxury quality 777 Mixed colors Business Office Fountain Pen student",
//////          description: "",
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/110/200/300.jpg",
//////            "https://i.picsum.photos/id/111/200/300.jpg",
//////            "https://i.picsum.photos/id/112/200/300.jpg",
//////            "https://i.picsum.photos/id/113/200/300.jpg",
//////            "https://i.picsum.photos/id/114/200/300.jpg",
//////            "https://i.picsum.photos/id/115/200/300.jpg"
//////          ],
//////          oldPrice: "0.99 - 1.29",
//////          newPrice: "0.73-0.95",
//////          images: [
//////            "https://i.picsum.photos/id/0/200/300.jpg",
//////            "https://i.picsum.photos/id/1/200/300.jpg",
//////            "https://i.picsum.photos/id/2/200/300.jpg",
//////            "https://i.picsum.photos/id/3/200/300.jpg",
//////            "https://i.picsum.photos/id/4/200/300.jpg",
//////            "https://i.picsum.photos/id/5/200/300.jpg"
//////          ],
//////          rate: 5.0,
//////          sale: 26,
//////          favoriteCount: 940,
//////          ordersCount: 597),
//////      Product(
//////          id: 10,
//////          title: "20mm Small Glass Cork Bottle Empty Glass Box",
//////          description:
//////          "Type: Empty Bottles\nColor: Transparent\nMaterial: Glass\nShape: Geometric\n\nSize: W*L\nStar: 22*26mm",
//////          oldPrice: "0.59 - 1.93",
//////          newPrice: "0.42 - 0.93",
//////          freeReturn: true,
//////          descriptionImages: [
//////            "https://i.picsum.photos/id/110/200/300.jpg",
//////            "https://i.picsum.photos/id/111/200/300.jpg",
//////            "https://i.picsum.photos/id/112/200/300.jpg",
//////            "https://i.picsum.photos/id/113/200/300.jpg",
//////            "https://i.picsum.photos/id/114/200/300.jpg",
//////            "https://i.picsum.photos/id/115/200/300.jpg"
//////          ],
//////          images: [
//////            "https://i.picsum.photos/id/100/200/300.jpg",
//////            "https://i.picsum.photos/id/101/200/300.jpg",
//////            "https://i.picsum.photos/id/102/200/300.jpg",
//////            "https://i.picsum.photos/id/103/200/300.jpg",
//////            "https://i.picsum.photos/id/104/200/300.jpg",
//////            "https://i.picsum.photos/id/105/200/300.jpg"
//////          ],
//////          rate: 2.8,
//////          sale: 28,
//////          favoriteCount: 289,
//////          ordersCount: 53),
//////    ];
//////    print("insertData()");
//////    var db = await database;
//////    await db.transaction((txn) async{
//////      print("_transaction");
////////      await txn.execute(
////////        "create table $imagesTable (id integer primary key autoincrement, imageUrl TEXT, productId INTEGER, isDescription INTEGER)",);
////////      await txn.execute(
////////          "create table $productsTable (id text primary key, title text, description text, oldPrice text, newPrice text, rate real, freeReturn integer, sale integer, favoriteCount integer, isFavorite integer, ordersCount integer)");
//////      var batch = txn.batch();
//////      _items.map((prod) {
//////        print("prodId: ${prod.id}");
//////        prod.descriptionImages.map((imgUrl){
//////          print("imgUrl: $imgUrl");
//////          batch.insert(imagesTable,
//////              {'imageUrl': imgUrl, 'productId': prod.id, 'isDescription': 1});
////////        _images.add({'imageUrl': img, 'isDescription': 1});
//////        });
//////        prod.images.map((imgUrl){
//////          batch.insert(imagesTable,
//////              {'imageUrl': imgUrl, 'productId': prod.id, 'isDescription': 0});
////////        _images.add({'imageUrl': img, 'isDescription': 0});
//////        });
//////        batch.insert(productsTable, prod.toMap());
//////      });
//////      final result = await batch.commit(noResult: true, continueOnError: true);
//////      print("_onCreate()");
//////      print("result = ${result.length}");
//////    });
////  }
//}
