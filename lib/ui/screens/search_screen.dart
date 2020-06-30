import 'package:aliexpress/helpers/extentions.dart';
import 'package:aliexpress/providers/product.dart';
import 'package:aliexpress/providers/products.dart';
import 'package:aliexpress/ui/screens/product_detail_screen.dart';
import 'package:aliexpress/ui/screens/products_screen_by_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search_screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();
  List<Product> products = [];
  List<Product> searchingProducts = [];
  String searchText = '';
  bool _isSearching = false;
  String oldSearchText = '';
  _changeSearchViewText() {
    setState(() {
      if (_searchController.text.isEmpty) {
        _isSearching = false;
        searchText = '';
      } else {
        _isSearching = true;
        searchText = _searchController.text;
      }
    });
  }

  @override
  void didChangeDependencies() {
    String oldSearchText =
    ModalRoute.of(context).settings.arguments as String;
    if(oldSearchText.isNotEmpty){
      _searchController.value = TextEditingValue(
          text: oldSearchText,
          selection: TextSelection.fromPosition(TextPosition(offset: oldSearchText.length))
      );
      oldSearchText = '';
    }
    super.didChangeDependencies();
  }

  @override
  void initState() {
    _searchController.addListener(_changeSearchViewText);
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    String oldSearchText =
//    ModalRoute.of(context).settings.arguments as String;
//    if(oldSearchText.isNotEmpty){
//        _searchController.value = TextEditingValue(
//          text: oldSearchText,
//          selection: TextSelection.fromPosition(TextPosition(offset: oldSearchText.length))
//        );
//        oldSearchText = '';
//    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8.0),
            border: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.greenAccent,
            )),
            hintText: "Search item",
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Colors.greenAccent,
            )),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: Colors.red,
            )),
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: Colors.black,
                  size: 24.0,
                ),
                onPressed: () {
                  setState(() {
                    _searchController.clear();
                  });
                }),
          ),
          autofocus: true,
        ),
      ),
      body: _buildListView(context),
    );
  }

  _buildListView(BuildContext ctx) {
    if(_isSearching)
      searchingProducts = Provider.of<Products>(ctx).searchProductItems(searchText);
    else
      searchingProducts = [];
    return ListView.builder(
        itemCount: searchingProducts.length,
        itemBuilder: (ctx, index) => Card(
          child: InkWell(
            onTap:() => OpenNewScreenWithName(ProductsScreenByCategory.routeName).openScreenWithMap(context, searchingProducts[index].categoryId, searchText, false),
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(searchingProducts[index].title),
            ),
          ),
        ));
//      (_isSearching)
//        ? Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: [],
//          )
//        : Container();
  }
}
