import 'dart:math';

import 'package:aliexpress/ui/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// ignore: must_be_immutable
class FeaturedCategories extends StatelessWidget {
  List<Map<String, String>> _items = [
    {
      'title': 'Women\'s Fashion',
      'imgUrl': 'https://i.picsum.photos/id/150/200/300.jpg'
    },
    {'title': 'Hair', 'imgUrl': 'https://i.picsum.photos/id/151/200/300.jpg'},
    {'title': 'Toys', 'imgUrl': 'https://i.picsum.photos/id/152/200/300.jpg'},
    {'title': 'Shoes', 'imgUrl': 'https://i.picsum.photos/id/153/200/300.jpg'},
    {'title': 'Kids', 'imgUrl': 'https://i.picsum.photos/id/154/200/300.jpg'},
    {
      'title': 'Men\'s Fashion',
      'imgUrl': 'https://i.picsum.photos/id/155/200/300.jpg'
    },
    {
      'title': 'Intimates',
      'imgUrl': 'https://i.picsum.photos/id/156/200/300.jpg'
    },
    {
      'title': 'Fun & Games',
      'imgUrl': 'https://i.picsum.photos/id/157/200/300.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 8, right: 8),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Feature categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Container(
                    height: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: FeaturedCategoriesItem(
                                    _items[0]['title'], _items[0]['imgUrl']),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                child: FeaturedCategoriesItem(
                                    _items[1]['title'], _items[1]['imgUrl']),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                child: FeaturedCategoriesItem(
                                    _items[2]['title'], _items[2]['imgUrl']),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                child: FeaturedCategoriesItem(
                                    _items[3]['title'], _items[3]['imgUrl']),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: FeaturedCategoriesItem(
                                    _items[4]['title'], _items[4]['imgUrl']),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                child: FeaturedCategoriesItem(
                                    _items[5]['title'], _items[5]['imgUrl']),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                child: FeaturedCategoriesItem(
                                    _items[6]['title'], _items[6]['imgUrl']),
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              Expanded(
                                child: FeaturedCategoriesItem(
                                    _items[7]['title'], _items[7]['imgUrl']),
                              ),
                            ],
                          ),
                        )
                      ],
                    ))),
          ],
        ),
      ),
    );
  }
}

class FeaturedCategoriesItem extends StatelessWidget {
  final String categoryName;
  final String imgUrl;

  FeaturedCategoriesItem(this.categoryName, this.imgUrl);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4.0),
      child: GridTile(
        child: CachedImage(imgUrl),
        footer: Container(
          width: double.infinity,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                .withOpacity(1),
          ),
          alignment: Alignment.center,
          child: Text(
            categoryName,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 9),
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
