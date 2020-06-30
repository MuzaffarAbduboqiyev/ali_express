import 'package:aliexpress/helpers/extentions.dart';
import 'package:aliexpress/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchView extends StatelessWidget {
  String searchText;
  bool isCategory;

  SearchView({this.searchText = '', this.isCategory = true});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => OpenNewScreenWithWidget(SearchScreen()).openScreenWithString(context, (isCategory) ? "" : searchText),
//      onTap: () => OpenNewScreenWithName(SearchScreen.routeName).openScreenWithString(context, (isCategory) ? "" : searchText),
      child: Container(
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: <Widget>[
            Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            Text(
              (searchText.isEmpty) ? "I'm shopping for..." : searchText,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
