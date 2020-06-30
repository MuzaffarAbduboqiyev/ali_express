import 'package:aliexpress/providers/products.dart';
import 'package:aliexpress/ui/widgets/cached_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashDeals extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverToBoxAdapter(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 180,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                    text: TextSpan(children: [
                  WidgetSpan(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: ClipOval(
                      child: Material(
                        color: Colors.orange[400],
                        child: Icon(Icons.show_chart,
                            size: 16, color: Colors.white),
                      ),
                    ),
                  )),
                  TextSpan(
                      text: "Flash Deals",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.black))
                ])),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
//                  mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(child: FlashDealsItem(0)),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(child: FlashDealsItem(1)),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(child: FlashDealsItem(2)),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FlashDealsItem extends StatelessWidget {
  final int _id;

  FlashDealsItem(this._id);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;
    return Container(
      child: products.length > 0 ? Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: CachedImage(
              products[_id].images[0],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 2),
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(8)),
            ),
            child: Text(
              "-${products[_id].sale}%",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
        ],
      ) : Center(child: CircularProgressIndicator(),),
    );
  }
}
