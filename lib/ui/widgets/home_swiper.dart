import 'dart:math';

import 'package:aliexpress/ui/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import './cached_image.dart';
import 'package:aliexpress/providers/products.dart';
import 'package:provider/provider.dart';

class HomeSwiper extends StatefulWidget {
  @override
  _HomeSwiperState createState() => _HomeSwiperState();
}

class _HomeSwiperState extends State<HomeSwiper> {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false).items;
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(40, 20),
                bottomRight: Radius.elliptical(40, 20)),
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
                      .withOpacity(1)),
              width: double.infinity,
            ),
          ),
          Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)),),
                padding: EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Swiper(
                    itemCount: 6,
                    itemBuilder: (ctx, index) => CachedImage(
                      products[index].images[0],
                    ),
                    onTap: (index) {
                      Navigator.pushNamed(context, ProductDetailScreen.routeName,
                          arguments: products[index].id);
                    },
                    autoplay: true,
                    pagination: SwiperPagination(),
                    controller: SwiperController(),
                    onIndexChanged: (index) {
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
