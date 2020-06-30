import 'package:aliexpress/helpers/extentions.dart';
import 'package:aliexpress/providers/product.dart';
import 'package:aliexpress/ui/screens/product_detail_screen.dart';
import 'package:aliexpress/ui/widgets/cached_image.dart';
import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final Product product;

  GridItem(this.product);
//
//  void _openDetailScreen(BuildContext context, int productId) {
//    Navigator.push(
//        context,
//        PageRouteBuilder(
//          pageBuilder: (
//            BuildContext context,
//            Animation<double> animation,
//            Animation<double> secondaryAnimation,
//          ) => ProductDetailScreen(),
//          settings: RouteSettings(arguments: productId),
//          transitionDuration: Duration(milliseconds: 1000),
//          transitionsBuilder: (
//            BuildContext context,
//            Animation<double> animation,
//            Animation<double> secondaryAnimation,
//            Widget child,
//          ) => ScaleTransition(
//            scale: CurvedAnimation(
//            parent: animation,
//            curve: Curves.slowMiddle,
//          ),
//            child: child,
//          ),
//        ));
//  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => OpenNewScreenWithWidget(ProductDetailScreen()).openScreenWithScaleTransition(context, product.id),
//      onTap: () => _openDetailScreen(context, product.id),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: Container(
          child: Card(
            elevation: 1.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4),
                          topRight: Radius.circular(4)),
                      child: CachedImage(product.images[0])),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 4.0, right: 4.0, top: 4.0, bottom: 2.0),
                  child: Text(
                    product.title,
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ),
                (product.freeReturn)
                    ? Padding(
                        padding: const EdgeInsets.only(
                            left: 4.0, right: 4.0, top: 2.0, bottom: 2.0),
                        child: Text(
                          " Free Return ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                              backgroundColor: Colors.grey[100]),
                        ),
                      )
                    : Padding(padding: EdgeInsets.all(0.0)),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 4.0, right: 4.0, top: 2.0, bottom: 2.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: " SALE ",
                          style: TextStyle(
                              color: Colors.white,
                              backgroundColor: Colors.red[400])),
                      TextSpan(
                          text:
                              " US \$${product.newPriceBegin} - ${product.newPriceEnd}",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold))
                    ]),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 4.0, right: 4.0, top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        (product.ordersCount > 0 && product.rate >= 3.0)
                            ? RichText(
                                text: TextSpan(children: [
                                WidgetSpan(
                                    child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                  child: Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.red[400],
                                  ),
                                )),
                                TextSpan(
                                  text:
                                      " ${product.rate} | ${product.ordersCount} sold",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                )
                              ]))
                            : Text(
                                "${product.ordersCount} sold",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.grey),
                                maxLines: 1,
                              ),
                        Flexible(
                          child: SizedBox(),
                          fit: FlexFit.tight,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0, top: 2.0),
                          child: Icon(
                            Icons.more_horiz,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
