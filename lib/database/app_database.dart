//import 'dart:async';
//import 'package:aliexpress/models/category_data.dart';
//import 'package:aliexpress/models/sub_category_data.dart';
//import 'package:aliexpress/models/tree_category_data.dart';
//import 'package:path/path.dart';
//import 'package:path_provider/path_provider.dart';
//import 'package:sembast/sembast.dart';
//import 'package:sembast/sembast_io.dart';
//import 'package:aliexpress/providers/product.dart';
//
//class AppDatabase {
////  static const String PRODUCT_STORE_NAME = 'products';
////  static const String CATEGORY_STORE_NAME = 'categories';
////  static const String SUB_CATEGORY_STORE_NAME = 'sub_categories';
////  static const String TREE_CATEGORY_STORE_NAME = 'tree_categories';
////
////  final _productStore = intMapStoreFactory.store(PRODUCT_STORE_NAME);
////  final _categoryStore = intMapStoreFactory.store(CATEGORY_STORE_NAME);
////  final _subCategoryStore = intMapStoreFactory.store(SUB_CATEGORY_STORE_NAME);
////  final _treeCategoryStore = intMapStoreFactory.store(TREE_CATEGORY_STORE_NAME);
////
////  StoreRef get productStore => _productStore;
////
////  StoreRef get categoryStore => _categoryStore;
////
////  StoreRef get subCategoryStore => _subCategoryStore;
////
////  StoreRef get treeCategoryStore => _treeCategoryStore;
////
////  AppDatabase._();
////
////  static final AppDatabase _singleton = AppDatabase._();
////
////  static AppDatabase get instance => _singleton;
////  Completer<Database> _dbOpenCompleter;
////
////  Future<Database> get _database async {
////    return _dbOpenCompleter.future;
////  }
////
////  Future initDatabase() async {
////    if (_dbOpenCompleter == null) {
////      _dbOpenCompleter = Completer();
////      await _openDatabase();
//////      insertProducts();
////    }
////  }
////
////  Future<void> _openDatabase() async {
////    final appDocumentDir = await getApplicationDocumentsDirectory();
////    final dbPath = join(appDocumentDir.path, 'prod.db');
////    final databases = await databaseFactoryIo.openDatabase(dbPath);
////    _dbOpenCompleter.complete(databases);
////  }
////
////  Future<List<Product>> getAllProducts() async {
////    List<Product> products = [];
////    final result = await productStore.find(await _database);
////    result.map((productMap) {
////      products.add(Product.fromMap(productMap.key, productMap.value));
////    }).toList();
////    return products;
////  }
////
////  Future<List<Product>> getCategoryProducts(
////      int subCategoryId, int treeCategoryId) async {
////    List<Product> products = [];
////    final result = await productStore.find(await _database,
////        finder: Finder(
////            filter: Filter.and([
////          Filter.equals('subCategoryId', subCategoryId),
////          Filter.equals('treeCategoryId', treeCategoryId)
////        ])));
////    result.map((productMap) {
////      products.add(Product.fromMap(productMap.key, productMap.value));
////    }).toList();
////    return products;
////  }
////
////  Future<List<CategoryData>> getCategories() async {
////    List<CategoryData> categories = [];
////    final result = await categoryStore.find(await _database);
////    result.map((categoryMap) {
////      categories.add(CategoryData.fromMap(categoryMap.key, categoryMap.value));
////    }).toList();
////    return categories;
////  }
////
////  Future<List<SubCategoryData>> getSubCategories(int categoryId) async {
////    List<SubCategoryData> subCategories = [];
////    final result = await subCategoryStore.find(await _database,
////        finder: Finder(filter: Filter.equals("categoryId", categoryId)));
////    result.map((subCategoryMap) {
////      subCategories.add(SubCategoryData.fromMap(subCategoryMap.value));
////    }).toList();
////    return subCategories;
////  }
////
////  Future<List<TreeCategoryData>> getTreeCategories(int subCategoryId) async {
////    List<TreeCategoryData> treeCategories = [];
////    final result = await treeCategoryStore.find(await _database,
////        finder: Finder(filter: Filter.equals('subCategoryId', subCategoryId)));
////    result.map((treeCategoryMap) {
////      treeCategories.add(TreeCategoryData.fromMap(treeCategoryMap.value));
////    }).toList();
////    return treeCategories;
////  }
////
////  Future<void> updateFavoriteWithCount(
////      int keyId, bool isFavorite, int favoriteCount) async {
////    var record = productStore.record(keyId);
////    await record.update(await _database, {
////      FieldKey.escape("isFavorite"): isFavorite,
////      FieldKey.escape('favoriteCount'): favoriteCount
////    }).then((value) => print(value));
////  }
//
////  Future<void> insertProducts() async {
////    List<CategoryData> categories = [
////      CategoryData(id: 0, name: 'Popular Categories', imageUrl: 'fiveHundredPx'),
////      CategoryData(id: 1, name: 'Apparel Accessories', imageUrl: 'accessibleIcon'),
////      CategoryData(id: 2, name: 'Apparel for Men', imageUrl: 'accusoft'),
////      CategoryData(id: 3, name: 'Apparel for Women', imageUrl: 'acquisitionsIncorporated'),
////      CategoryData(
////          id: 4, name: 'Popular Automobiles & Motorcycle', imageUrl: 'ad'),
////      CategoryData(id: 5, name: 'Beauty & Health', imageUrl: 'addressBook'),
////      CategoryData(
////          id: 6, name: 'Cellphones & Telecommunication', imageUrl: 'solidAddressBook'),
////      CategoryData(id: 7, name: 'Computer & Office', imageUrl: 'addressCard'),
////      CategoryData(id: 8, name: 'Consumer Electronics', imageUrl: 'solidAddressCard'),
////      CategoryData(id: 9, name: 'Education & Office', imageUrl: 'adjust'),
////      CategoryData(id: 10, name: 'Electronic Components', imageUrl: 'adn'),
////      CategoryData(id: 11, name: 'Food', imageUrl: 'adobe'),
////      CategoryData(id: 12, name: 'Furniture', imageUrl: 'adversal'),
////      CategoryData(id: 13, name: 'Tools', imageUrl: 'affiliatetheme'),
////      CategoryData(id: 14, name: 'Toys & Hobbies', imageUrl: 'airFreshener'),
////      CategoryData(id: 15, name: 'Watches', imageUrl: 'airbnb'),
////      CategoryData(id: 16, name: 'Wedding & Events', imageUrl: 'algolia'),
////    ];
////
////    List<SubCategoryData> subCategories = [
////      SubCategoryData(
////          id: 0, categoryId: 1, name: 'Women\'s Glasses', isExpand: true),
////      SubCategoryData(
////          id: 1, categoryId: 1, name: 'Women\'s Hats', isExpand: true),
////      SubCategoryData(
////          id: 2, categoryId: 1, name: 'Women\'s Scarves', isExpand: false),
////      SubCategoryData(
////          id: 3,
////          categoryId: 1,
////          name: 'Women\'s Hair Accessories',
////          isExpand: false),
////      SubCategoryData(
////          id: 4, categoryId: 1, name: 'Women\'s Gloves', isExpand: false),
////      SubCategoryData(
////          id: 5, categoryId: 1, name: 'Women\'s Belts', isExpand: false),
////      SubCategoryData(
////          id: 6, categoryId: 1, name: 'Women\'s Accessories', isExpand: true),
////      SubCategoryData(
////          id: 7, categoryId: 1, name: 'Men\'s Hats', isExpand: true),
////      SubCategoryData(
////          id: 8, categoryId: 1, name: 'Men\'s Scarves', isExpand: false),
////      SubCategoryData(
////          id: 9,
////          categoryId: 1,
////          name: 'Men\'s Hair Accessories',
////          isExpand: false),
////      SubCategoryData(
////          id: 10, categoryId: 1, name: 'Men\'s Gloves', isExpand: false),
////      SubCategoryData(
////          id: 11, categoryId: 1, name: 'Men\'s Belts', isExpand: false),
////      SubCategoryData(
////          id: 12, categoryId: 1, name: 'Men\'s Accessories', isExpand: true),
////      SubCategoryData(
////          id: 13,
////          categoryId: 2,
////          name: "Hoodies & Sweatshirts",
////          isExpand: false),
////      SubCategoryData(
////          id: 14, categoryId: 2, name: "Tops & Tees", isExpand: true),
////      SubCategoryData(
////          id: 15, categoryId: 2, name: "Jackets & Coats", isExpand: true),
////      SubCategoryData(id: 16, categoryId: 2, name: "Pants", isExpand: true),
////      SubCategoryData(id: 17, categoryId: 2, name: "Shirts", isExpand: true),
////      SubCategoryData(id: 18, categoryId: 2, name: "Jeans", isExpand: false),
////      SubCategoryData(id: 19, categoryId: 2, name: "Sweaters", isExpand: true),
////      SubCategoryData(
////          id: 20, categoryId: 2, name: "Suits & Blazers", isExpand: true),
////      SubCategoryData(
////          id: 21, categoryId: 2, name: "Casual Shorts", isExpand: false),
////      SubCategoryData(
////          id: 22, categoryId: 2, name: "Men\'s Sets", isExpand: false),
////      SubCategoryData(
////          id: 23, categoryId: 2, name: "Board Shorts", isExpand: false),
////      SubCategoryData(id: 24, categoryId: 3, name: "Dresses", isExpand: false),
////      SubCategoryData(
////          id: 25, categoryId: 3, name: "Blouses & Shirts", isExpand: false),
////      SubCategoryData(
////          id: 26,
////          categoryId: 3,
////          name: "Hoodies & Sweatshirts",
////          isExpand: false),
////      SubCategoryData(id: 27, categoryId: 3, name: "Sweaters", isExpand: true),
////      SubCategoryData(
////          id: 28, categoryId: 3, name: "Jackets & Coats", isExpand: true),
////      SubCategoryData(id: 29, categoryId: 3, name: "Bottoms", isExpand: true),
////      SubCategoryData(
////          id: 30, categoryId: 4, name: "Car Lights", isExpand: true),
////      SubCategoryData(
////          id: 31,
////          categoryId: 4,
////          name: "Auto Replacement Parts",
////          isExpand: true),
////      SubCategoryData(
////          id: 32, categoryId: 4, name: "Car Electronics", isExpand: true),
////      SubCategoryData(
////          id: 33, categoryId: 4, name: "Interior Accessories", isExpand: true),
////      SubCategoryData(
////          id: 34, categoryId: 4, name: "Exterior Accessories", isExpand: true),
////      SubCategoryData(id: 35, categoryId: 4, name: "Car Wash & Maintenance"),
////      SubCategoryData(
////          id: 36, categoryId: 5, name: "Nails Art & Tools", isExpand: true),
////      SubCategoryData(id: 37, categoryId: 5, name: "Makeup", isExpand: true),
////      SubCategoryData(
////          id: 38, categoryId: 5, name: "Health Care", isExpand: true),
////      SubCategoryData(id: 39, categoryId: 5, name: "Scin Care", isExpand: true),
////      SubCategoryData(
////          id: 40, categoryId: 5, name: "Bath & Shower", isExpand: true),
////      SubCategoryData(
////          id: 41, categoryId: 5, name: "Tatto & BodyArt", isExpand: true),
////      SubCategoryData(id: 42, categoryId: 6, name: "Cellphones"),
////      SubCategoryData(id: 43, categoryId: 6, name: "iPhones"),
////      SubCategoryData(id: 44, categoryId: 6, name: "Feature Phones"),
////      SubCategoryData(
////          id: 45,
////          categoryId: 6,
////          name: "Mobile Phone Accessories",
////          isExpand: true),
////      SubCategoryData(
////          id: 46, categoryId: 6, name: "Mobile Phone Parts", isExpand: true),
////      SubCategoryData(
////          id: 47, categoryId: 7, name: "Office Electronics", isExpand: true),
////      SubCategoryData(
////          id: 48, categoryId: 7, name: "Computer Peripherals", isExpand: true),
////      SubCategoryData(id: 49, categoryId: 7, name: "Laptops"),
////      SubCategoryData(id: 50, categoryId: 7, name: "Tablets"),
////      SubCategoryData(
////          id: 51, categoryId: 7, name: "Storage Devices", isExpand: true),
////      SubCategoryData(
////          id: 52,
////          categoryId: 8,
////          name: "Portable Audio & Video",
////          isExpand: true),
////      SubCategoryData(
////          id: 53, categoryId: 8, name: "Smart Electronics", isExpand: true),
////      SubCategoryData(
////          id: 54, categoryId: 8, name: "Camera & Photo", isExpand: true),
////      SubCategoryData(
////          id: 55, categoryId: 8, name: "Earphone & Headphone", isExpand: true),
////      SubCategoryData(
////          id: 56, categoryId: 8, name: "Wearable Device", isExpand: true),
////      SubCategoryData(id: 57, categoryId: 8, name: "Robot", isExpand: true),
////      SubCategoryData(
////          id: 58, categoryId: 8, name: "HiFi Devices", isExpand: true),
////      SubCategoryData(
////          id: 59,
////          categoryId: 9,
////          name: "Pen, Pencil & Writing Supplies",
////          isExpand: true),
////      SubCategoryData(
////          id: 60,
////          categoryId: 9,
////          name: "Notebooks & Writing Pads",
////          isExpand: true),
////      SubCategoryData(id: 61, categoryId: 9, name: "Stationery Stickers")
////    ];
////
////    List<TreeCategoryData> _treeCategories = [
////      TreeCategoryData(
////          id: 0,
////          subCategoryId: 59,
////          name: 'Calligraphy Brushes',
////          imageUrl: "https://i.picsum.photos/id/500/200/300.jpg"),
////      TreeCategoryData(
////          id: 1,
////          subCategoryId: 59,
////          name: 'Ballpoint Pens',
////          imageUrl: "https://i.picsum.photos/id/501/200/300.jpg"),
////      TreeCategoryData(
////          id: 2,
////          subCategoryId: 59,
////          name: 'Crayons',
////          imageUrl: "https://i.picsum.photos/id/502/200/300.jpg"),
////      TreeCategoryData(
////          id: 3,
////          subCategoryId: 59,
////          name: 'Banner Pens',
////          imageUrl: "https://i.picsum.photos/id/503/200/300.jpg"),
////      TreeCategoryData(
////          id: 4,
////          subCategoryId: 59,
////          name: 'Oil Pastel',
////          imageUrl: "https://i.picsum.photos/id/504/200/300.jpg"),
////      TreeCategoryData(
////          id: 5,
////          subCategoryId: 59,
////          name: 'Correction Supplies',
////          imageUrl: "https://i.picsum.photos/id/505/200/300.jpg"),
////      TreeCategoryData(
////          id: 6,
////          subCategoryId: 59,
////          name: 'Fountain Pens',
////          imageUrl: "https://i.picsum.photos/id/506/200/300.jpg"),
////      TreeCategoryData(
////          id: 7,
////          subCategoryId: 59,
////          name: 'Paint Brushes',
////          imageUrl: "https://i.picsum.photos/id/507/200/300.jpg"),
////      TreeCategoryData(
////          id: 8,
////          subCategoryId: 59,
////          name: 'Gel Pens',
////          imageUrl: "https://i.picsum.photos/id/508/200/300.jpg"),
////      TreeCategoryData(
////          id: 9,
////          subCategoryId: 59,
////          name: 'Pencils',
////          imageUrl: "https://i.picsum.photos/id/509/200/300.jpg"),
////      TreeCategoryData(
////          id: 10,
////          subCategoryId: 59,
////          name: 'Market Highlighters',
////          imageUrl: "https://i.picsum.photos/id/510/200/300.jpg"),
////      TreeCategoryData(
////          id: 11,
////          subCategoryId: 59,
////          name: 'Pen refill',
////          imageUrl: "https://i.picsum.photos/id/511/200/300.jpg"),
////    ];
////
////    for (int i = 12; i <= 186; i++) {
////      int lastSubCategoryId = 0;
////      if (subCategories[i % 62].isExpand) {
////        _treeCategories.add(TreeCategoryData(
////            id: i,
////            subCategoryId: subCategories[i % 62].id,
////            name: subCategories[i % 62].name,
////            imageUrl: "https://i.picsum.photos/id/${500 + i}/200/300.jpg"));
////        lastSubCategoryId = subCategories[i % 62].id;
////      } else {
////        _treeCategories.add(TreeCategoryData(
////            id: i,
////            subCategoryId: lastSubCategoryId,
////            name: subCategories[i % 62].name,
////            imageUrl: "https://i.picsum.photos/id/${500 + i}/200/300.jpg"));
////      }
////    }
////
////    List<Product> _items = [
////      Product(
////          id: 0,
////          subCategoryId: 59,
////          treeCategoryId: 0,
////          title:
////              "Luxury quality 777 Mixed colors Business Office Fountain Pen student",
////          description: "",
////          descriptionImages: [
////            "https://i.picsum.photos/id/0/200/300.jpg",
////            "https://i.picsum.photos/id/1/200/300.jpg",
////            "https://i.picsum.photos/id/2/200/300.jpg",
////            "https://i.picsum.photos/id/3/200/300.jpg",
////            "https://i.picsum.photos/id/4/200/300.jpg",
////            "https://i.picsum.photos/id/5/200/300.jpg"
////          ],
////          oldPrice: "0.99 - 1.29",
////          newPrice: "0.73-0.95",
////          images: [
////            "https://i.picsum.photos/id/10/200/300.jpg",
////            "https://i.picsum.photos/id/11/200/300.jpg",
////            "https://i.picsum.photos/id/12/200/300.jpg",
////            "https://i.picsum.photos/id/13/200/300.jpg",
////            "https://i.picsum.photos/id/14/200/300.jpg",
////            "https://i.picsum.photos/id/15/200/300.jpg"
////          ],
////          rate: 2.5,
////          sale: 26,
////          favoriteCount: 940,
////          ordersCount: 597),
////      Product(
////          id: 1,
////          subCategoryId: 59,
////          treeCategoryId: 1,
////          title:
////              "New listing High quality 405 Various colors Nib school Student office stationers Fountain Pen",
////          description: "",
////          descriptionImages: [
////            "https://i.picsum.photos/id/20/200/300.jpg",
////            "https://i.picsum.photos/id/21/200/300.jpg",
////            "https://i.picsum.photos/id/22/200/300.jpg",
////            "https://i.picsum.photos/id/23/200/300.jpg",
////            "https://i.picsum.photos/id/24/200/300.jpg",
////            "https://i.picsum.photos/id/25/200/300.jpg"
////          ],
////          oldPrice: "0.99 - 1.99",
////          newPrice: "0.76 - 1.53",
////          images: [
////            "https://i.picsum.photos/id/30/200/300.jpg",
////            "https://i.picsum.photos/id/31/200/300.jpg",
////            "https://i.picsum.photos/id/32/200/300.jpg",
////            "https://i.picsum.photos/id/33/200/300.jpg",
////            "https://i.picsum.photos/id/34/200/300.jpg",
////            "https://i.picsum.photos/id/35/200/300.jpg"
////          ],
////          rate: 3.8,
////          sale: 23,
////          favoriteCount: 1025,
////          ordersCount: 4737),
////      Product(
////          id: 2,
////          subCategoryId: 59,
////          treeCategoryId: 2,
////          title:
////              "MIYA 18 colors Couache Paint Set 30 ml Portable Case with Palette Couache",
////          description: "",
////          descriptionImages: [
////            "https://i.picsum.photos/id/40/200/300.jpg",
////            "https://i.picsum.photos/id/41/200/300.jpg",
////            "https://i.picsum.photos/id/42/200/300.jpg",
////            "https://i.picsum.photos/id/43/200/300.jpg",
////            "https://i.picsum.photos/id/44/200/300.jpg",
////            "https://i.picsum.photos/id/45/200/300.jpg"
////          ],
////          oldPrice: "28.99 - 42.99",
////          newPrice: "22.90 - 33.96",
////          images: [
////            "https://i.picsum.photos/id/50/200/300.jpg",
////            "https://i.picsum.photos/id/51/200/300.jpg",
////            "https://i.picsum.photos/id/52/200/300.jpg",
////            "https://i.picsum.photos/id/53/200/300.jpg",
////            "https://i.picsum.photos/id/54/200/300.jpg",
////            "https://i.picsum.photos/id/55/200/300.jpg"
////          ],
////          freeReturn: true,
////          rate: 1.2,
////          sale: 21,
////          favoriteCount: 6012,
////          ordersCount: 751),
////      Product(
////          id: 3,
////          subCategoryId: 59,
////          treeCategoryId: 3,
////          title: "3 Pieces Of Nylon Plastic Water Container",
////          description: "",
////          descriptionImages: [
////            "https://i.picsum.photos/id/60/200/300.jpg",
////            "https://i.picsum.photos/id/61/200/300.jpg",
////            "https://i.picsum.photos/id/62/200/300.jpg",
////            "https://i.picsum.photos/id/63/200/300.jpg",
////            "https://i.picsum.photos/id/64/200/300.jpg",
////            "https://i.picsum.photos/id/65/200/300.jpg"
////          ],
////          oldPrice: "2.50 / lot",
////          newPrice: "1.97 / lot",
////          images: [
////            "https://i.picsum.photos/id/70/200/300.jpg",
////            "https://i.picsum.photos/id/71/200/300.jpg",
////            "https://i.picsum.photos/id/72/200/300.jpg",
////            "https://i.picsum.photos/id/73/200/300.jpg",
////            "https://i.picsum.photos/id/74/200/300.jpg",
////            "https://i.picsum.photos/id/75/200/300.jpg"
////          ],
////          rate: 3.9,
////          sale: 21,
////          favoriteCount: 2343,
////          ordersCount: 276),
////      Product(
////          id: 4,
////          subCategoryId: 59,
////          treeCategoryId: 4,
////          title: "Casual Women Watches Starry Sky Quartz",
////          description:
////              "Casual Women Watches Starry Sky Quartz Wristwatch Female ClockItem Type: Ladies Quartz Wrist WatchesDial Diametr: 32mmStyle: Fashion Casual Simple Creative",
////          descriptionImages: [
////            "https://i.picsum.photos/id/80/200/300.jpg",
////            "https://i.picsum.photos/id/81/200/300.jpg",
////            "https://i.picsum.photos/id/82/200/300.jpg",
////            "https://i.picsum.photos/id/83/200/300.jpg",
////            "https://i.picsum.photos/id/84/200/300.jpg",
////            "https://i.picsum.photos/id/85/200/300.jpg"
////          ],
////          oldPrice: "2.44 - 2.54",
////          newPrice: "4.78 - 4.98",
////          images: [
////            "https://i.picsum.photos/id/90/200/300.jpg",
////            "https://i.picsum.photos/id/91/200/300.jpg",
////            "https://i.picsum.photos/id/92/200/300.jpg",
////            "https://i.picsum.photos/id/93/200/300.jpg",
////            "https://i.picsum.photos/id/94/200/300.jpg",
////            "https://i.picsum.photos/id/95/200/300.jpg"
////          ],
////          freeReturn: true,
////          rate: 0,
////          sale: 49,
////          favoriteCount: 165,
////          ordersCount: 144),
////      Product(
////          id: 5,
////          subCategoryId: 59,
////          treeCategoryId: 5,
////          title: "Fashion Sport Watch LED Luxury Man Digital Military Army",
////          description: "",
////          descriptionImages: [
////            "https://i.picsum.photos/id/100/200/300.jpg",
////            "https://i.picsum.photos/id/101/200/300.jpg",
////            "https://i.picsum.photos/id/102/200/300.jpg",
////            "https://i.picsum.photos/id/103/200/300.jpg",
////            "https://i.picsum.photos/id/104/200/300.jpg",
////            "https://i.picsum.photos/id/105/200/300.jpg"
////          ],
////          oldPrice: "0.01",
////          newPrice: "29.80 - 33.90",
////          images: [
////            "https://i.picsum.photos/id/16/200/300.jpg",
////            "https://i.picsum.photos/id/17/200/300.jpg",
////            "https://i.picsum.photos/id/18/200/300.jpg",
////            "https://i.picsum.photos/id/19/200/300.jpg",
////            "https://i.picsum.photos/id/26/200/300.jpg",
////            "https://i.picsum.photos/id/27/200/300.jpg"
////          ],
////          rate: 5.0,
////          sale: 26,
////          favoriteCount: 940,
////          ordersCount: 597),
////      Product(
////          id: 6,
////          subCategoryId: 59,
////          treeCategoryId: 6,
////          title: "2020 Minimalist Men's Fashion Ultra Thin Watches",
////          description:
////              "Feature:100% brand new and high qualityGender: MenStyle Casual",
////          descriptionImages: [
////            "https://i.picsum.photos/id/110/200/300.jpg",
////            "https://i.picsum.photos/id/111/200/300.jpg",
////            "https://i.picsum.photos/id/112/200/300.jpg",
////            "https://i.picsum.photos/id/113/200/300.jpg",
////            "https://i.picsum.photos/id/114/200/300.jpg",
////            "https://i.picsum.photos/id/115/200/300.jpg"
////          ],
////          oldPrice: "0.99 - 1.29",
////          newPrice: "0.73-0.95",
////          images: [
////            "https://i.picsum.photos/id/120/200/300.jpg",
////            "https://i.picsum.photos/id/121/200/300.jpg",
////            "https://i.picsum.photos/id/122/200/300.jpg",
////            "https://i.picsum.photos/id/123/200/300.jpg",
////            "https://i.picsum.photos/id/124/200/300.jpg",
////            "https://i.picsum.photos/id/125/200/300.jpg"
////          ],
////          freeReturn: true,
////          rate: 4.3,
////          sale: 0,
////          favoriteCount: 10035,
////          ordersCount: 19993),
////      Product(
////          id: 7,
////          subCategoryId: 59,
////          treeCategoryId: 7,
////          title: "20mm Small Glass Cork Bottle Empty Glass Box",
////          description:
////              "Type: Empty BottlesColor: TransparentMaterial: GlassShape: GeometricSize: W*LStar: 22*26mm",
////          descriptionImages: [
////            "https://i.picsum.photos/id/130/200/300.jpg",
////            "https://i.picsum.photos/id/131/200/300.jpg",
////            "https://i.picsum.photos/id/132/200/300.jpg",
////            "https://i.picsum.photos/id/133/200/300.jpg",
////            "https://i.picsum.photos/id/134/200/300.jpg",
////            "https://i.picsum.photos/id/135/200/300.jpg"
////          ],
////          oldPrice: "0.59 - 1.93",
////          newPrice: "0.42 - 0.93",
////          images: [
////            "https://i.picsum.photos/id/140/200/300.jpg",
////            "https://i.picsum.photos/id/141/200/300.jpg",
////            "https://i.picsum.photos/id/142/200/300.jpg",
////            "https://i.picsum.photos/id/143/200/300.jpg",
////            "https://i.picsum.photos/id/144/200/300.jpg",
////            "https://i.picsum.photos/id/145/200/300.jpg"
////          ],
////          rate: 2.8,
////          sale: 28,
////          favoriteCount: 289,
////          ordersCount: 53),
////      Product(
////          id: 8,
////          subCategoryId: 59,
////          treeCategoryId: 8,
////          title:
////              "Luxury quality 777 Mixed colors Business Office Fountain Pen student",
////          description: "",
////          descriptionImages: [
////            "https://i.picsum.photos/id/150/200/300.jpg",
////            "https://i.picsum.photos/id/151/200/300.jpg",
////            "https://i.picsum.photos/id/152/200/300.jpg",
////            "https://i.picsum.photos/id/153/200/300.jpg",
////            "https://i.picsum.photos/id/154/200/300.jpg",
////            "https://i.picsum.photos/id/155/200/300.jpg"
////          ],
////          oldPrice: "0.99 - 1.29",
////          newPrice: "0.73-0.95",
////          images: [
////            "https://i.picsum.photos/id/160/200/300.jpg",
////            "https://i.picsum.photos/id/161/200/300.jpg",
////            "https://i.picsum.photos/id/162/200/300.jpg",
////            "https://i.picsum.photos/id/163/200/300.jpg",
////            "https://i.picsum.photos/id/164/200/300.jpg",
////            "https://i.picsum.photos/id/165/200/300.jpg"
////          ],
////          freeReturn: true,
////          rate: 5.0,
////          sale: 26,
////          favoriteCount: 940,
////          ordersCount: 597),
////      Product(
////          id: 9,
////          subCategoryId: 59,
////          treeCategoryId: 9,
////          title:
////              "Luxury quality 777 Mixed colors Business Office Fountain Pen student",
////          description: "",
////          descriptionImages: [
////            "https://i.picsum.photos/id/170/200/300.jpg",
////            "https://i.picsum.photos/id/171/200/300.jpg",
////            "https://i.picsum.photos/id/172/200/300.jpg",
////            "https://i.picsum.photos/id/173/200/300.jpg",
////            "https://i.picsum.photos/id/174/200/300.jpg",
////            "https://i.picsum.photos/id/175/200/300.jpg"
////          ],
////          oldPrice: "0.99 - 1.29",
////          newPrice: "0.73-0.95",
////          images: [
////            "https://i.picsum.photos/id/180/200/300.jpg",
////            "https://i.picsum.photos/id/181/200/300.jpg",
////            "https://i.picsum.photos/id/182/200/300.jpg",
////            "https://i.picsum.photos/id/183/200/300.jpg",
////            "https://i.picsum.photos/id/184/200/300.jpg",
////            "https://i.picsum.photos/id/185/200/300.jpg"
////          ],
////          rate: 5.0,
////          sale: 26,
////          favoriteCount: 940,
////          ordersCount: 597),
////      Product(
////          id: 10,
////          subCategoryId: 59,
////          treeCategoryId: 10,
////          title: "20mm Small Glass Cork Bottle Empty Glass Box",
////          description:
////              "Type: Empty BottlesColor: TransparentMaterial: GlassShape: GeometricSize: W*LStar: 22*26mm",
////          descriptionImages: [
////            "https://i.picsum.photos/id/190/200/300.jpg",
////            "https://i.picsum.photos/id/191/200/300.jpg",
////            "https://i.picsum.photos/id/192/200/300.jpg",
////            "https://i.picsum.photos/id/193/200/300.jpg",
////            "https://i.picsum.photos/id/194/200/300.jpg",
////            "https://i.picsum.photos/id/195/200/300.jpg"
////          ],
////          oldPrice: "0.59 - 1.93",
////          newPrice: "0.42 - 0.93",
////          freeReturn: true,
////          images: [
////            "https://i.picsum.photos/id/200/200/300.jpg",
////            "https://i.picsum.photos/id/201/200/300.jpg",
////            "https://i.picsum.photos/id/202/200/300.jpg",
////            "https://i.picsum.photos/id/203/200/300.jpg",
////            "https://i.picsum.photos/id/204/200/300.jpg",
////            "https://i.picsum.photos/id/205/200/300.jpg"
////          ],
////          rate: 2.8,
////          sale: 28,
////          favoriteCount: 289,
////          ordersCount: 53),
////    ];
////
////    for (int i = 206; i < 500; i++) {
////      _items.add(Product(
////          id: i,
////          subCategoryId: _treeCategories[i % 187].subCategoryId,
////          treeCategoryId: _treeCategories[i % 187].id,
////          title: "$i mm Small Glass Cork Bottle Empty Glass Box",
////          description:
////              "Type: Empty BottlesColor: TransparentMaterial: GlassShape: GeometricSize: W*LStar: 22*26mm",
////          descriptionImages: [
////            "https://i.picsum.photos/id/$i/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 500}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 501}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 502}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 503}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 504}/200/300.jpg"
////          ],
////          oldPrice: "$i.59 - $i.93",
////          newPrice: "${i + 1}.42 - ${i + 1}.93",
////          freeReturn: true,
////          images: [
////            "https://i.picsum.photos/id/${i + 505}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 506}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 507}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 508}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 509}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 510}/200/300.jpg"
////          ],
////          rate: 2.8,
////          sale: 28,
////          favoriteCount: i,
////          ordersCount: 53));
////    }
////    for (int i = 500; i < 687; i++) {
////      int lastSubCatId = 2;
////      if (!(subCategories[i % 62].isExpand)) {
////        lastSubCatId = subCategories[i % 62].id;
////      }
////      _items.add(Product(
////          id: i,
////          subCategoryId: lastSubCatId,
////          treeCategoryId: -1,
////          title: "$i mm Small Glass Cork Bottle Empty Glass Box",
////          description:
////              "Type: Empty BottlesColor: TransparentMaterial: GlassShape: GeometricSize: W*LStar: 22*26mm",
////          descriptionImages: [
////            "https://i.picsum.photos/id/$i/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 500}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 501}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 502}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 503}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 504}/200/300.jpg"
////          ],
////          oldPrice: "$i.59 - $i.93",
////          newPrice: "${i + 1}.42 - ${i + 1}.93",
////          freeReturn: true,
////          images: [
////            "https://i.picsum.photos/id/${i + 505}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 506}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 507}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 508}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 509}/200/300.jpg",
////            "https://i.picsum.photos/id/${i + 510}/200/300.jpg"
////          ],
////          rate: 2.8,
////          sale: 28,
////          favoriteCount: i,
////          ordersCount: 53));
////    }
////
////    List<Map<String, Object>> _product = [];
////    _items.map((prod) {
////      _product.add(prod.toMap());
////    }).toList();
////
////    List<Map<String, Object>> _category = [];
////    categories.map((categ) {
////      _category.add(categ.toMap());
////    }).toList();
////
////    List<Map<String, Object>> _subCategory = [];
////    subCategories.map((subCateg) {
////      _subCategory.add(subCateg.toMap());
////    }).toList();
////
////    List<Map<String, Object>> _treeCategory = [];
////    _treeCategories.map((treeCateg) {
////      _treeCategory.add(treeCateg.toMap());
////    }).toList();
////
////    await _database.then((value) {
////      value.transaction((transaction) async {
////        await productStore.addAll(transaction, _product);
////        await categoryStore.addAll(transaction, _category);
////        await subCategoryStore.addAll(transaction, _subCategory);
////        await treeCategoryStore.addAll(transaction, _treeCategory);
////      });
////    });
////  }
//}
