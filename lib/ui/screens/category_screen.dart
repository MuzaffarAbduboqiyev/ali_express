import 'package:aliexpress/database/app_database.dart';
import 'package:aliexpress/helpers/extentions.dart';
import 'package:aliexpress/models/category_data.dart';
import 'package:aliexpress/models/sub_category_data.dart';
import 'package:aliexpress/providers/categories.dart';
import 'package:aliexpress/ui/screens/product_detail_screen.dart';
import 'package:aliexpress/ui/screens/products_screen_by_category.dart';
import 'package:aliexpress/ui/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:icons_helper/icons_helper.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = "/category_screen";

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  ScrollController _scrollController;
  int lastPosition = 0;

  final pageController = PageController(initialPage: 0, keepPage: true);

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categories =
        Provider.of<Categories>(context, listen: false).categoryItems;
    categories[lastPosition].isSelected = true;
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 80.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (ctx, index) => InkWell(
                        onTap: () {
                          if (lastPosition != index) {
                            setState(() {
                              categories[lastPosition].isSelected = false;
                              categories[index].isSelected = true;
                              lastPosition = index;
                            });
                          }
                        },
                        child: Container(
                            margin: EdgeInsets.only(bottom: 1.0),
                            decoration: BoxDecoration(
                              color: (categories[index].isSelected)
                                  ? Colors.grey[100]
                                  : Colors.grey[300],
                            ),
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  getIconUsingPrefix(
                                      name: 'fa.${categories[index].imageUrl}'),
                                  size: 24,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  categories[index].name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 10.0,
//                                    color: (categories[index].isSelected)
//                                      ? Colors.black
//                                      : Colors.white,
                                  ),
                                ),
                              ],
                            )),
                      ),
                      shrinkWrap: true,
//                      physics: NeverScrollableScrollPhysics(),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: SubCategoryItems(categories[lastPosition].subCategories),
            )
          ],
        ),
      ),
    );
  }
}

class SubCategoryItems extends StatefulWidget {
  final List<SubCategoryData> subCategoryData;

  SubCategoryItems(this.subCategoryData);

  @override
  _SubCategoryItemsState createState() => _SubCategoryItemsState();
}

class _SubCategoryItemsState extends State<SubCategoryItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: ListView.builder(
        itemCount: widget.subCategoryData.length,
        itemBuilder: (ctx, index) => (widget.subCategoryData[index].isExpand)
            ? Container(
                decoration: BoxDecoration(color: Colors.grey[100]),
                margin: EdgeInsets.only(bottom: 1),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(widget.subCategoryData[index].name),
                      trailing: IconButton(
                        icon: Icon((widget.subCategoryData[index].isSelected)
                            ? Icons.expand_less
                            : Icons.expand_more),
                        onPressed: () {
                          setState(() {
                            widget.subCategoryData[index].isSelected =
                                !widget.subCategoryData[index].isSelected;
                          });
                        },
                      ),
                    ),
                    if (widget.subCategoryData[index].isSelected)
                      GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 4.0,
                          crossAxisSpacing: 4.0,
                          children: widget.subCategoryData[index].treeCategories
                              .map((e) => InkWell(
                                    onTap: () => OpenNewScreenWithName(
                                            ProductsScreenByCategory.routeName)
                                        .openScreenWithMap(ctx, e.id, e.name, true),
                                    child: Container(
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Column(
                                        children: [
                                          Container(
                                              width: double.infinity,
                                              height: 75.0,
                                              child: CachedImage(e.imageUrl)),
                                          Expanded(
                                            child: Text(
                                              e.name,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              softWrap: true,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList())
                  ],
                ),
              )
            : Container(
                decoration: BoxDecoration(color: Colors.grey[100]),
                margin: EdgeInsets.only(bottom: 1),
//                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                child: ListTile(
                  title: Text(widget.subCategoryData[index].name),
                  onTap: () => OpenNewScreenWithName(ProductsScreenByCategory.routeName)
                      .openScreenWithMap(
                          ctx,
                          widget.subCategoryData[index].categoryId,
                          widget.subCategoryData[index].name, true),
                ),
//                child: Text(widget.subCategoryData[index].name),
              ),
      ),
    );
  }
}
