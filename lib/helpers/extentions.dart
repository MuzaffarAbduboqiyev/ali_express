import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:useful_extension/useful_extension.dart';

extension OpenNewScreenWithName on String {
  void openScreenWithString(BuildContext context, String argument) {
    Navigator.pushNamed(context, this, arguments: argument);
  }

  void openScreenWithInt(BuildContext context, int argument) {
    Navigator.pushNamed(context, this, arguments: argument);
  }

  void openScreenWithMap(BuildContext context, int categoryId,
      String searchText, bool isCategory) {
    Navigator.pushNamed(context, this, arguments: {
      'searchText': searchText,
      'categoryId': categoryId,
      'isCategory': isCategory
    });

  }
  void openScreen(BuildContext context) {
    Navigator.pushNamed(context, this);
  }
}

extension OpenNewScreenWithWidget on Widget{
  void openScreenWithScaleTransition(BuildContext context, int argument) {
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              ) => this,
          settings: RouteSettings(arguments: argument),
          transitionDuration: Duration(milliseconds: 800),
          transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
              ) => ScaleTransition(
            scale: CurvedAnimation(
              parent: animation,
              curve: Curves.slowMiddle,
            ),
            child: child,
          ),
        ));
  }
  void openScreenWithString(BuildContext context, String argument) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (_) => this, settings: RouteSettings(arguments: argument),
        ));
  }
}

extension ShowToast on String{
  void showToast(BuildContext context){
    Toast.show('Please select product options first', context,
        gravity: Toast.BOTTOM, duration: 2);
  }
}
