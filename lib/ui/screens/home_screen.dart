import 'package:aliexpress/providers/products.dart';
import 'package:aliexpress/ui/widgets/cached_image.dart';
import 'package:aliexpress/ui/widgets/featured_categories.dart';
import 'package:aliexpress/ui/widgets/flash_deals.dart';
import 'package:aliexpress/ui/widgets/hot_menu.dart';
import 'package:aliexpress/ui/widgets/recommendation_products.dart';
import 'package:aliexpress/ui/widgets/search_view.dart';
import 'package:provider/provider.dart';
import './product_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../widgets/home_swiper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animationTween;

  @override
  void didChangeDependencies(){
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    _animationTween = ColorTween(begin: Colors.transparent, end: Colors.red)
        .animate(_controller);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      _controller.animateTo(scrollInfo.metrics.pixels / 100);
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
          onNotification: _scrollListener,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                MainFrame(),
                AnimationAppBar(_controller, _animationTween)
              ],
            ),
          )),
    );
  }
}

class MainFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        HomeSwiper(),
        HotMenu(),
        NewUserGifts(),
        FunAtHome(),
        FlashDeals(),
        FeaturedCategories(),
        SellerRecommendations(Provider.of<Products>(context, listen: false).items.take(10).toList(), isSellerRecommendation: true,)
      ],
    );
  }
}

class AnimationAppBar extends StatelessWidget {
  final AnimationController _colorAnimationController;
  final Animation _colorTween;

  AnimationAppBar(this._colorAnimationController, this._colorTween);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: AnimatedBuilder(
        animation: _colorAnimationController,
        builder: (context, child) => AppBar(
          backgroundColor: _colorTween.value,
          elevation: 0,
          titleSpacing: 0.0,
          centerTitle: true,
          title: SearchView(),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class NewUserGifts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      sliver: SliverToBoxAdapter(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  "assets/newusergift.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FunAtHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      sliver: SliverToBoxAdapter(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 175,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                        text: TextSpan(children: [
                      WidgetSpan(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: ClipOval(
                          child: Material(
                            color: Colors.green,
                            child:
                                Icon(Icons.home, size: 14, color: Colors.white),
                          ),
                        ),
                      )),
                      TextSpan(
                          text: "Fun at Home",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: PostsSwiper(),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                            child: FunAtHomeItems(
                                "Indoor Essentials",
                                "https://picsum.photos/id/120/200/300.jpg",
                                "https://picsum.photos/id/121/200/300.jpg")),
                        SizedBox(
                          width: 6,
                        ),
                        Expanded(
                            child: FunAtHomeItems(
                                "Indoor Essentials",
                                "https://picsum.photos/id/122/200/300.jpg",
                                "https://picsum.photos/id/123/200/300.jpg")),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FunAtHomeItems extends StatelessWidget {
  final String title;
  final String imgUrl1;
  final String imgUrl2;

  FunAtHomeItems(this.title, this.imgUrl1, this.imgUrl2);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontSize: 11, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4.0,
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      child: CachedImage(imgUrl1)),
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      child: CachedImage(imgUrl1)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PostsSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _post = [
      'Get social and write a post',
      'Check in daily & get coins',
      'Get entertained with our games & activities',
    ];
    return Container(
      height: 20,
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.only(left: 10, top: 2, right: 4, bottom: 2),
      decoration: BoxDecoration(
          color: Colors.orange[50], borderRadius: BorderRadius.circular(15.0)),
      child: Swiper(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, index) => Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                    child: Icon(
                  Icons.volume_up,
                  color: Colors.orangeAccent[200],
                  size: 12,
                )),
                WidgetSpan(
                    child: SizedBox(
                  width: 4,
                )),
                TextSpan(
                    text: _post[index],
                    style: TextStyle(
                        color: Colors.orangeAccent[200], fontSize: 12))
              ])),
              Icon(
                Icons.chevron_right,
                color: Colors.orangeAccent[200],
                size: 12,
              ),
            ],
          ),
        ),
        autoplay: true,
        controller: SwiperController(),
      ),
    );
  }
}
