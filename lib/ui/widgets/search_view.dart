import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {

  void _openSearchPage(BuildContext context){

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => _openSearchPage(context),
      child: Container(
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 2, bottom: 2),
                child: Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            Text(
              "I'm shopping for...",
              style: TextStyle(
                  color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
