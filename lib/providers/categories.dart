
import 'package:aliexpress/models/category_data.dart';
import 'package:aliexpress/models/sub_category_data.dart';
import 'package:aliexpress/models/tree_category_data.dart';

import 'package:flutter/foundation.dart';

class Categories extends ChangeNotifier {
  List<CategoryData> _categoryItems = [
    CategoryData(
        id: 0,
        name: 'Popular Categories',
        imageUrl: 'fiveHundredPx',
        subCategories: [
          SubCategoryData(
              id: 100,
              categoryId: 0,
              name: 'Women\'s Glasses',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 200,
                    subCategoryId: 100,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
                TreeCategoryData(
                    id: 201,
                    subCategoryId: 100,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
                TreeCategoryData(
                    id: 202,
                    subCategoryId: 100,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
                TreeCategoryData(
                    id: 203,
                    subCategoryId: 100,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
                TreeCategoryData(
                    id: 204,
                    subCategoryId: 100,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
                TreeCategoryData(
                    id: 205,
                    subCategoryId: 100,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
                TreeCategoryData(
                    id: 206,
                    subCategoryId: 100,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/506/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 101,
              categoryId: 0,
              name: 'Women\'s Hats',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 207,
                    subCategoryId: 101,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
                TreeCategoryData(
                    id: 208,
                    subCategoryId: 101,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
                TreeCategoryData(
                    id: 209,
                    subCategoryId: 101,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
                TreeCategoryData(
                    id: 210,
                    subCategoryId: 101,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
                TreeCategoryData(
                    id: 211,
                    subCategoryId: 101,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
                TreeCategoryData(
                    id: 212,
                    subCategoryId: 101,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
                TreeCategoryData(
                    id: 213,
                    subCategoryId: 101,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/513/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 102,
              categoryId: 0,
              name: 'Women\'s Scarves',
              isExpand: false),
        ]),
    CategoryData(
        id: 1,
        name: 'Apparel Accessories',
        imageUrl: 'accessibleIcon',
        subCategories: [
          SubCategoryData(
              id: 103,
              categoryId: 1,
              name: 'Women\'s Glasses',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 214,
                    subCategoryId: 103,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/514/200/300.jpg"),
                TreeCategoryData(
                    id: 215,
                    subCategoryId: 103,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/515/200/300.jpg"),
                TreeCategoryData(
                    id: 216,
                    subCategoryId: 103,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/516/200/300.jpg"),
                TreeCategoryData(
                    id: 217,
                    subCategoryId: 103,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/517/200/300.jpg"),
                TreeCategoryData(
                    id: 218,
                    subCategoryId: 103,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/518/200/300.jpg"),
                TreeCategoryData(
                    id: 219,
                    subCategoryId: 103,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/519/200/300.jpg"),
                TreeCategoryData(
                    id: 220,
                    subCategoryId: 103,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/520/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 104,
              categoryId: 1,
              name: 'Women\'s Hats',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 221,
                    subCategoryId: 104,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/521/200/300.jpg"),
                TreeCategoryData(
                    id: 222,
                    subCategoryId: 104,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/522/200/300.jpg"),
                TreeCategoryData(
                    id: 223,
                    subCategoryId: 104,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/523/200/300.jpg"),
                TreeCategoryData(
                    id: 224,
                    subCategoryId: 104,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/524/200/300.jpg"),
                TreeCategoryData(
                    id: 225,
                    subCategoryId: 104,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/525/200/300.jpg"),
                TreeCategoryData(
                    id: 226,
                    subCategoryId: 104,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/526/200/300.jpg"),
                TreeCategoryData(
                    id: 227,
                    subCategoryId: 104,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/527/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 105,
              categoryId: 1,
              name: 'Women\'s Scarves',
              isExpand: false),
        ]),
    CategoryData(
        id: 2,
        name: 'Apparel for Men',
        imageUrl: 'accusoft',
        subCategories: [
          SubCategoryData(
              id: 106,
              categoryId: 2,
              name: 'Women\'s Glasses',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 228,
                    subCategoryId: 106,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/528/200/300.jpg"),
                TreeCategoryData(
                    id: 229,
                    subCategoryId: 106,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/529/200/300.jpg"),
                TreeCategoryData(
                    id: 230,
                    subCategoryId: 106,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/530/200/300.jpg"),
                TreeCategoryData(
                    id: 231,
                    subCategoryId: 106,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/531/200/300.jpg"),
                TreeCategoryData(
                    id: 232,
                    subCategoryId: 106,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/532/200/300.jpg"),
                TreeCategoryData(
                    id: 233,
                    subCategoryId: 106,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/533/200/300.jpg"),
                TreeCategoryData(
                    id: 234,
                    subCategoryId: 106,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/534/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 107,
              categoryId: 2,
              name: 'Women\'s Hats',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 235,
                    subCategoryId: 107,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/535/200/300.jpg"),
                TreeCategoryData(
                    id: 236,
                    subCategoryId: 107,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/536/200/300.jpg"),
                TreeCategoryData(
                    id: 237,
                    subCategoryId: 107,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/537/200/300.jpg"),
                TreeCategoryData(
                    id: 238,
                    subCategoryId: 107,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/538/200/300.jpg"),
                TreeCategoryData(
                    id: 239,
                    subCategoryId: 107,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/539/200/300.jpg"),
                TreeCategoryData(
                    id: 240,
                    subCategoryId: 107,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/540/200/300.jpg"),
                TreeCategoryData(
                    id: 241,
                    subCategoryId: 107,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/541/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 108,
              categoryId: 2,
              name: 'Women\'s Scarves',
              isExpand: false),
        ]),
    CategoryData(
        id: 3,
        name: 'Apparel for Women',
        imageUrl: 'acquisitionsIncorporated',
        subCategories: [
          SubCategoryData(
              id: 100,
              categoryId: 3,
              name: 'Women\'s Glasses',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 200,
                    subCategoryId: 100,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
                TreeCategoryData(
                    id: 201,
                    subCategoryId: 100,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
                TreeCategoryData(
                    id: 202,
                    subCategoryId: 100,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
                TreeCategoryData(
                    id: 203,
                    subCategoryId: 100,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
                TreeCategoryData(
                    id: 204,
                    subCategoryId: 100,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
                TreeCategoryData(
                    id: 205,
                    subCategoryId: 100,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
                TreeCategoryData(
                    id: 206,
                    subCategoryId: 100,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/506/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 101,
              categoryId: 3,
              name: 'Women\'s Hats',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 207,
                    subCategoryId: 101,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
                TreeCategoryData(
                    id: 208,
                    subCategoryId: 101,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
                TreeCategoryData(
                    id: 209,
                    subCategoryId: 101,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
                TreeCategoryData(
                    id: 210,
                    subCategoryId: 101,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
                TreeCategoryData(
                    id: 211,
                    subCategoryId: 101,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
                TreeCategoryData(
                    id: 212,
                    subCategoryId: 101,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
                TreeCategoryData(
                    id: 213,
                    subCategoryId: 101,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/513/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 102,
              categoryId: 3,
              name: 'Women\'s Scarves',
              isExpand: false),
        ]),
    CategoryData(
        id: 4,
        name: 'Popular Automobiles & Motorcycle',
        imageUrl: 'ad',
        subCategories: [
          SubCategoryData(
              id: 100,
              categoryId: 4,
              name: 'Women\'s Glasses',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 200,
                    subCategoryId: 100,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
                TreeCategoryData(
                    id: 201,
                    subCategoryId: 100,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
                TreeCategoryData(
                    id: 202,
                    subCategoryId: 100,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
                TreeCategoryData(
                    id: 203,
                    subCategoryId: 100,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
                TreeCategoryData(
                    id: 204,
                    subCategoryId: 100,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
                TreeCategoryData(
                    id: 205,
                    subCategoryId: 100,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
                TreeCategoryData(
                    id: 206,
                    subCategoryId: 100,
                    name: 'Fountain Pens',
                    imageUrl: "https://i.picsum.photos/id/506/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 101,
              categoryId: 4,
              name: 'Women\'s Hats',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 207,
                    subCategoryId: 100,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
                TreeCategoryData(
                    id: 208,
                    subCategoryId: 100,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
                TreeCategoryData(
                    id: 209,
                    subCategoryId: 100,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
                TreeCategoryData(
                    id: 210,
                    subCategoryId: 100,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
                TreeCategoryData(
                    id: 211,
                    subCategoryId: 100,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
                TreeCategoryData(
                    id: 212,
                    subCategoryId: 100,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
                TreeCategoryData(
                    id: 213,
                    subCategoryId: 100,
                    name: 'Fountain Pens',
                    imageUrl: "https://i.picsum.photos/id/513/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 102,
              categoryId: 4,
              name: 'Women\'s Scarves',
              isExpand: false),
        ]),
    CategoryData(
        id: 5,
        name: 'Beauty & Health',
        imageUrl: 'addressBook',
        subCategories: [
          SubCategoryData(
              id: 100,
              categoryId: 5,
              name: 'Women\'s Glasses',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 200,
                    subCategoryId: 100,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
                TreeCategoryData(
                    id: 201,
                    subCategoryId: 100,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
                TreeCategoryData(
                    id: 202,
                    subCategoryId: 100,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
                TreeCategoryData(
                    id: 203,
                    subCategoryId: 100,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
                TreeCategoryData(
                    id: 204,
                    subCategoryId: 100,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
                TreeCategoryData(
                    id: 205,
                    subCategoryId: 100,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
                TreeCategoryData(
                    id: 206,
                    subCategoryId: 100,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/506/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 101,
              categoryId: 5,
              name: 'Women\'s Hats',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 207,
                    subCategoryId: 100,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
                TreeCategoryData(
                    id: 208,
                    subCategoryId: 100,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
                TreeCategoryData(
                    id: 209,
                    subCategoryId: 100,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
                TreeCategoryData(
                    id: 210,
                    subCategoryId: 100,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
                TreeCategoryData(
                    id: 211,
                    subCategoryId: 100,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
                TreeCategoryData(
                    id: 212,
                    subCategoryId: 100,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
                TreeCategoryData(
                    id: 213,
                    subCategoryId: 100,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/513/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 102,
              categoryId: 5,
              name: 'Women\'s Scarves',
              isExpand: false),
        ]),
    CategoryData(
        id: 6,
        name: 'Cellphones & Telecommunication',
        imageUrl: 'solidAddressBook',
        subCategories: [
          SubCategoryData(
              id: 100,
              categoryId: 6,
              name: 'Women\'s Glasses',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 200,
                    subCategoryId: 100,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
                TreeCategoryData(
                    id: 201,
                    subCategoryId: 100,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
                TreeCategoryData(
                    id: 202,
                    subCategoryId: 100,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
                TreeCategoryData(
                    id: 203,
                    subCategoryId: 100,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
                TreeCategoryData(
                    id: 204,
                    subCategoryId: 100,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
                TreeCategoryData(
                    id: 205,
                    subCategoryId: 100,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
                TreeCategoryData(
                    id: 206,
                    subCategoryId: 100,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/506/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 101,
              categoryId: 6,
              name: 'Women\'s Hats',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 207,
                    subCategoryId: 100,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
                TreeCategoryData(
                    id: 208,
                    subCategoryId: 100,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
                TreeCategoryData(
                    id: 209,
                    subCategoryId: 100,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
                TreeCategoryData(
                    id: 210,
                    subCategoryId: 100,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
                TreeCategoryData(
                    id: 211,
                    subCategoryId: 100,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
                TreeCategoryData(
                    id: 212,
                    subCategoryId: 100,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
                TreeCategoryData(
                    id: 213,
                    subCategoryId: 100,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/513/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 102,
              categoryId: 6,
              name: 'Women\'s Scarves',
              isExpand: false),
        ]),
    CategoryData(
        id: 7,
        name: 'Computer & Office',
        imageUrl: 'addressCard',
        subCategories: [
          SubCategoryData(
              id: 100,
              categoryId: 7,
              name: 'Women\'s Glasses',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 200,
                    subCategoryId: 100,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
                TreeCategoryData(
                    id: 201,
                    subCategoryId: 100,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
                TreeCategoryData(
                    id: 202,
                    subCategoryId: 100,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
                TreeCategoryData(
                    id: 203,
                    subCategoryId: 100,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
                TreeCategoryData(
                    id: 204,
                    subCategoryId: 100,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
                TreeCategoryData(
                    id: 205,
                    subCategoryId: 100,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
                TreeCategoryData(
                    id: 206,
                    subCategoryId: 100,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/506/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 101,
              categoryId: 7,
              name: 'Women\'s Hats',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 207,
                    subCategoryId: 100,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
                TreeCategoryData(
                    id: 208,
                    subCategoryId: 100,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
                TreeCategoryData(
                    id: 209,
                    subCategoryId: 100,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
                TreeCategoryData(
                    id: 210,
                    subCategoryId: 100,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
                TreeCategoryData(
                    id: 211,
                    subCategoryId: 100,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
                TreeCategoryData(
                    id: 212,
                    subCategoryId: 100,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
                TreeCategoryData(
                    id: 213,
                    subCategoryId: 100,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/513/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 102,
              categoryId: 7,
              name: 'Women\'s Scarves',
              isExpand: false),
        ]),
    CategoryData(
        id: 8,
        name: 'Consumer Electronics',
        imageUrl: 'solidAddressCard',
        subCategories: [
          SubCategoryData(
              id: 100,
              categoryId: 8,
              name: 'Women\'s Glasses',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 200,
                    subCategoryId: 100,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/500/200/300.jpg"),
                TreeCategoryData(
                    id: 201,
                    subCategoryId: 100,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/501/200/300.jpg"),
                TreeCategoryData(
                    id: 202,
                    subCategoryId: 100,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/502/200/300.jpg"),
                TreeCategoryData(
                    id: 203,
                    subCategoryId: 100,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/503/200/300.jpg"),
                TreeCategoryData(
                    id: 204,
                    subCategoryId: 100,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/504/200/300.jpg"),
                TreeCategoryData(
                    id: 205,
                    subCategoryId: 100,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/505/200/300.jpg"),
                TreeCategoryData(
                    id: 206,
                    subCategoryId: 100,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/506/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 101,
              categoryId: 8,
              name: 'Women\'s Hats',
              isExpand: true,
              treeCategories: [
                TreeCategoryData(
                    id: 207,
                    subCategoryId: 100,
                    name: 'Calligraphy Brushes',
                    imageUrl: "https://picsum.photos/id/507/200/300.jpg"),
                TreeCategoryData(
                    id: 208,
                    subCategoryId: 100,
                    name: 'Ballpoint Pens',
                    imageUrl: "https://picsum.photos/id/508/200/300.jpg"),
                TreeCategoryData(
                    id: 209,
                    subCategoryId: 100,
                    name: 'Crayons',
                    imageUrl: "https://picsum.photos/id/509/200/300.jpg"),
                TreeCategoryData(
                    id: 210,
                    subCategoryId: 100,
                    name: 'Banner Pens',
                    imageUrl: "https://picsum.photos/id/510/200/300.jpg"),
                TreeCategoryData(
                    id: 211,
                    subCategoryId: 100,
                    name: 'Oil Pastel',
                    imageUrl: "https://picsum.photos/id/511/200/300.jpg"),
                TreeCategoryData(
                    id: 212,
                    subCategoryId: 100,
                    name: 'Correction Supplies',
                    imageUrl: "https://picsum.photos/id/512/200/300.jpg"),
                TreeCategoryData(
                    id: 213,
                    subCategoryId: 100,
                    name: 'Fountain Pens',
                    imageUrl: "https://picsum.photos/id/513/200/300.jpg"),
              ]),
          SubCategoryData(
              id: 102,
              categoryId: 8,
              name: 'Women\'s Scarves',
              isExpand: false),
        ]),
  ];

  List<CategoryData> get categoryItems {
    return [..._categoryItems];
  }

}
