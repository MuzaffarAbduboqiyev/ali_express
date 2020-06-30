import 'package:aliexpress/providers/product.dart';
import 'package:aliexpress/ui/widgets/grid_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SellerRecommendations extends StatelessWidget {
  final List<Product> products;
  bool isSellerRecommendation;

  SellerRecommendations(this.products, {this.isSellerRecommendation = false});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: Colors.grey[300]),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if(isSellerRecommendation)
              Text(
                "Seller Recommendations",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              products.length > 0 ? SingleChildScrollView(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (ctx, index) => GridItem(products[index]),
                  itemCount: products.length,
                ),
              ) : Center(child: CircularProgressIndicator(),)
            ],
          )),
    );
  }
}