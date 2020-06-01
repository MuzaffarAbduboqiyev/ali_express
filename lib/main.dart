import 'package:aliexpress/providers/products.dart';
import 'package:aliexpress/providers/product.dart';
import 'package:aliexpress/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import './ui/screens/home_screen.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
      ],
      child: BackGestureWidthTheme(
        backGestureWidth: BackGestureWidth.fraction(1 / 2),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              pageTransitionsTheme: PageTransitionsTheme(builders: {
                TargetPlatform.android: CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
                TargetPlatform.iOS: CupertinoPageTransitionsBuilderCustomBackGestureWidth()
              })),
          home: HomeScreen(),
          routes: {
            ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          },
        ),
      ),
    );
  }
}
