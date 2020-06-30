import 'package:aliexpress/providers/products.dart';
import 'package:aliexpress/ui/screens/product_detail_screen.dart';
import 'package:aliexpress/ui/widgets/recommendation_products.dart';
import 'package:aliexpress/ui/widgets/search_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreenByCategory extends StatelessWidget {
  static const String routeName = '/products_screen';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
    ModalRoute.of(context).settings.arguments as Map<String, dynamic>;

    final searchText = arguments['searchText'] as String;
    final categoryId = arguments['categoryId'] as int;
    final isCategory = arguments['isCategory'] as bool;

    return Scaffold(
      appBar: AppBar(
        title: SearchView(searchText: searchText, isCategory: isCategory,),
      ),
      body: CustomScrollView(
        slivers: [
          SellerRecommendations(Provider.of<Products>(context, listen: false).getProductsByCategory(categoryId)),
        ],
      ),

    );
//      SellerRecommendations(productId, isCategory: true,);
  }
}
