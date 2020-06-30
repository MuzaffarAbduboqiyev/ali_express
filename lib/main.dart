import 'package:aliexpress/database/app_database.dart';
import 'package:aliexpress/database/local_database.dart';
import 'package:aliexpress/providers/cart.dart';
import 'package:aliexpress/providers/categories.dart';
import 'package:aliexpress/providers/products.dart';
import 'package:aliexpress/providers/product.dart';
import 'package:aliexpress/ui/screens/add_to_cart_screen.dart';
import 'package:aliexpress/ui/screens/cart_screen.dart';
import 'package:aliexpress/ui/screens/category_screen.dart';
import 'package:aliexpress/ui/screens/login_screen.dart';
import 'package:aliexpress/ui/screens/product_detail_screen.dart';
import 'package:aliexpress/ui/screens/products_screen_by_category.dart';
import 'package:aliexpress/ui/screens/registration_screen.dart';
import 'package:aliexpress/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import './ui/screens/home_screen.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
//  AppDatabase.instance.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Product()),
        ChangeNotifierProvider.value(value: Categories()),
        ChangeNotifierProvider.value(value: Cart()),
      ],
      child: MaterialApp(
        builder: (ctx, child) =>
            ScrollConfiguration(behavior: MyBehavior(), child: child),
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
//          ProductDetailScreen.routeName: (ctx) =>  ProductDetailScreen(),
          CategoryScreen.routeName: (ctx) => CategoryScreen(),
          ProductsScreenByCategory.routeName: (ctx) => ProductsScreenByCategory(),
//          SearchScreen.routeName: (ctx) => SearchScreen(),
          LoginScreen.routeName: (ctx) => LoginScreen(),
          RegistrationScreen.routeName: (ctx) => RegistrationScreen(),
          AddToCartScreen.routeName: (ctx) => AddToCartScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) =>
      ClampingScrollPhysics();

  @override
  Widget buildViewportChrome(
          BuildContext context, Widget child, AxisDirection axisDirection) =>
      child;
}
