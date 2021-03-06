import 'package:aliexpress/helpers/extentions.dart';
import 'package:aliexpress/providers/cart.dart';
import 'package:aliexpress/ui/screens/add_to_cart_screen.dart';
import 'package:aliexpress/ui/screens/cart_screen.dart';
import 'package:aliexpress/ui/widgets/badge.dart';
import 'package:aliexpress/ui/widgets/cached_image.dart';
import 'package:aliexpress/ui/widgets/recommendation_products.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:aliexpress/providers/products.dart';
import 'package:aliexpress/providers/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String routeName = "/detail_screen";

  @override
  Widget build(BuildContext context) {
    final int productId = ModalRoute.of(context).settings.arguments as int;
    final product =
        Provider.of<Products>(context, listen: false).getProductById(productId);
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (ctx, isScrolled) {
              return <Widget>[
                ItemDetailAppBar(product),
              ];
            },
            body: CustomScrollView(slivers: [
              _ItemTitleWithPrice(product),
              _ItemDescription(product),
              SellerRecommendations(
                  Provider.of<Products>(context, listen: false)
                      .getProductsByProduct(product),
                  isSellerRecommendation: true),
            ])),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: BouncingWidget(
                  onPressed: () {
                    OpenNewScreenWithName(AddToCartScreen.routeName)
                        .openScreenWithInt(context, productId);
                  },
                  duration: Duration(milliseconds: 100),
                  scaleFactor: -1.0,
                  child: Container(
                      width: double.infinity,
                      height: kBottomNavigationBarHeight,
                      decoration: BoxDecoration(
                        color: Colors.orange[100],
                      ),
                      child: Center(
                        child: Text(
                          'ADD TO CART',
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ),
              Expanded(
                child: BouncingWidget(
                  onPressed: () {},
                  duration: Duration(milliseconds: 100),
                  scaleFactor: -1.0,
                  child: Container(
                      width: double.infinity,
                      height: kBottomNavigationBarHeight,
                      decoration: BoxDecoration(
                        color: Colors.red,
                      ),
                      child: Center(
                        child: Text(
                          'BUY NOW',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}

class ItemDetailAppBar extends StatelessWidget {
  final Product product;

  ItemDetailAppBar(this.product);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        "Detail",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      actions: [
        Consumer<Cart>(
          builder: (_, cart, ch) =>
              Badge(child: ch, value: cart.itemCount.toString()),
          child: IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            tooltip: "Opening shopping cart",
            onPressed: () =>
                OpenNewScreenWithName(CartScreen.routeName).openScreen(context),
          ),
        ),
        IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            tooltip: "Share product link",
            onPressed: () {}),
        IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            tooltip: "Opening menu",
            onPressed: () {}),
      ],
      backgroundColor: Colors.black,
      flexibleSpace: MyFlexibleSpaceBar(product.images),
      expandedHeight: 250,
//      floating: true,
    );
  }
}

class MyFlexibleSpaceBar extends StatefulWidget {
  final List<String> images;

  MyFlexibleSpaceBar(this.images);

  @override
  _MyFlexibleSpaceBarState createState() => _MyFlexibleSpaceBarState();
}

class _MyFlexibleSpaceBarState extends State<MyFlexibleSpaceBar> {
  var _index = 1;

  void _changePosition(int index) {
    _index = index + 1;
  }

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Swiper(
            itemBuilder: (ctx, index) => CachedImage(widget.images[index]),
            itemCount: widget.images.length,
            controller: SwiperController(),
            onIndexChanged: (index) {
              setState(() {
                _changePosition(index);
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0, right: 20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                      child: Text(
                        "$_index/${widget.images.length}",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemTitleWithPrice extends StatelessWidget {
  final Product _product;

  _ItemTitleWithPrice(this._product);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white),
//        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                title: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          "US \$${_product.newPriceBegin} - ${_product.newPriceEnd}",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  WidgetSpan(
                      child: Container(
                    margin: EdgeInsets.only(left: 4),
                    child: Text(
                      "-${_product.sale}%",
                      style: TextStyle(color: Colors.orange, fontSize: 10),
                    ),
                    decoration: BoxDecoration(color: Colors.amber[100]),
                    padding: EdgeInsets.all(4),
                  ))
                ])),
                subtitle: Text(
                  "US \$${_product.oldPrice}",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough),
                ),
                trailing: ChangeNotifierProvider.value(
                  value: _product,
                  child: Consumer<Product>(
                    builder: (ctx, prod, _) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: IconButton(
                            icon: prod.isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.orange,
                                    size: 20,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    size: 20,
                                  ),
                            onPressed: () {
                              prod.changeFavouriteState();
                            },
                          ),
                        ),
                        Expanded(
                          child: Text(prod.favoriteCount >= 10000
                              ? "9999+"
                              : "${prod.favoriteCount}"),
                        )
                      ],
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Text(
                _product.title,
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${_product.rate} "),
                  RatingBar(
                      initialRating: _product.rate,
                      allowHalfRating: true,
                      unratedColor: Colors.amber[100],
                      itemCount: 5,
                      itemSize: 16,
                      itemBuilder: (ctx, index) => Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                      onRatingUpdate: (_) {}),
                  Text("  ${_product.ordersCount} orders"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  final Product _product;

  _ItemDescription(this._product);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        margin: EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 12),
              child: Text(
                "Item Description",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
            (_product.description.isNotEmpty)
                ? Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, top: 12.0, right: 8.0, bottom: 4.0),
                    child: Text(_product.description),
                  )
                : SizedBox(
                    height: 0,
                  ),
            _DescriptionImages(
                _product.productItems.map((e) => e.imageUrl).toList()),
          ],
        ),
      ),
    );
  }
}

class _DescriptionImages extends StatelessWidget {
  final List<String> imgUrls;

  _DescriptionImages(this.imgUrls);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: imgUrls.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (ctx, index) => Container(
              height: 250,
              child: CachedImage(imgUrls[index]),
            ));
  }
}
