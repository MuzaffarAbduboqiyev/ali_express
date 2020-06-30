import 'package:aliexpress/models/cart_data.dart';
import 'package:aliexpress/providers/cart.dart';
import 'package:aliexpress/providers/product.dart';
import 'package:aliexpress/providers/products.dart';
import 'package:aliexpress/ui/screens/add_to_cart_screen.dart';
import 'package:aliexpress/ui/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final String productKey;

  CartItem(this.productKey);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Cart>(context);
    final imgUrl = Provider.of<Products>(context, listen: false).getProductById(int.parse(productKey)).productItems[provider.items[productKey].itemId].imageUrl;
    final title = Provider.of<Products>(context, listen: false).getProductById(int.parse(productKey)).title;
    _updateQuantity(int newCount){
      provider.updateQuantity(productKey, newCount);
    }
    return Container(
      decoration: BoxDecoration(color: Colors.amber[100]),
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30.0,
            height: 150.0,
            margin: EdgeInsets.only(right: 10.0),
            child: Align(
              alignment: Alignment.center,
              child: Checkbox(
                  value: provider.isSelectedItem(productKey),
                  onChanged: (value) {
                      provider.indexSelected(productKey, value);
                  }),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120.0,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120.0,
                          width: 120.0,
                          child: CachedImage(imgUrl),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(title,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14.0)),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  'US \$${provider.items[productKey].price}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                ),
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: AddToCartCountWidget(
                                    _updateQuantity,
                                    initialCount: provider.items[productKey].quantity,
                                    isQuantity: false,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
