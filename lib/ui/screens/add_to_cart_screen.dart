import 'dart:async';

import 'package:aliexpress/helpers/extentions.dart';
import 'package:aliexpress/providers/cart.dart';
import 'package:aliexpress/providers/product.dart';
import 'package:aliexpress/providers/products.dart';
import 'package:aliexpress/ui/widgets/add_to_cart_item.dart';
import 'package:aliexpress/ui/widgets/cached_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class AddToCartScreen extends StatefulWidget {
  static const String routeName = '/add_to_cart_screen';

  @override
  _AddToCartScreenState createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  Product product;
  int productId;
  int currentItemIndex = 100;
  bool isSelected;
  int count = 1;
  bool isProcessContinue = false;

  @override
  void didChangeDependencies() {
    productId = ModalRoute.of(context).settings.arguments as int;
    product =
        Provider.of<Products>(context, listen: false).getProductById(productId);
    super.didChangeDependencies();
  }

  _setItemCount(int newCount) {
    count = newCount;
  }
  @override
  Widget build(BuildContext context) {
    isSelected = currentItemIndex < product.productItems.length;
    String currentPrice = (isSelected)
        ? '${product.productItems[currentItemIndex].price}'
        : ('${product.newPriceBegin}' + ' - ' + '${product.newPriceEnd}');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Item options',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.red,
        child: FlatButton(
          onPressed:() async{
            if (currentItemIndex == 100) {
              ShowToast('Please select product options first').showToast(context);
//              Toast.show('Please select product options first', context,
//                  gravity: Toast.BOTTOM, duration: 2);
            } else {
              setState(() {
                isProcessContinue = true;
              });
              Provider.of<Cart>(context, listen: false).addCartItem(
                  productId,
                  currentItemIndex,
                  count,
                  product.productItems[currentItemIndex].price, product.freeReturn);
              await Future.delayed(Duration(milliseconds: 500));
              Navigator.pop(context);
              setState(() {
                isProcessContinue = false;
              });
            }
          },
          child: (isProcessContinue)
              ? Container(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ))
              : Text(
                  'CONTINUE',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
        ),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 140.0,
              )),
              SliverToBoxAdapter(
                child: Divider(
                  height: 1,
                ),
              ),
              SliverToBoxAdapter(
                child: GridView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 8.0,
                      childAspectRatio: 1.0),
                  itemCount: product.productItems.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) => InkWell(
                    onTap: () {
                      setState(() {
                        (currentItemIndex != index)
                            ? currentItemIndex = index
                            : currentItemIndex = 100;
                      });
                    },
                    child: AddToCartItem(
                      imageUrl: product.productItems[index].imageUrl,
                      id: product.productItems[index].id,
                      currentIndex: currentItemIndex,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  height: 1,
                ),
              ),
              SliverToBoxAdapter(
                child: AddToCartCountWidget(_setItemCount),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  height: 1,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        (product.freeReturn)
                            ? "Free Shipping"
                            : "Shipping: US\$${2.14}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'To',
                            style: TextStyle(color: Colors.grey[400]),
                            children: <TextSpan>[
                              TextSpan(
                                  text: " United States ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                      'via Cainiao Super Economy \nEstimated Delivery: 30 - 50 days',
                                  style: TextStyle(color: Colors.grey[400]))
                            ]),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 130,
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(color: Colors.grey[50]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: CachedImage((isSelected)
                      ? product.productItems[currentItemIndex].imageUrl
                      : product.images[0]),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      text: TextSpan(
                          text: ' US \$$currentPrice',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' / piece',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14.0),
                            )
                          ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class AddToCartCountWidget extends StatefulWidget {
  final Function _function;
  int initialCount;
  bool isQuantity;

  AddToCartCountWidget(this._function, {this.initialCount = 1, this.isQuantity = true});

  @override
  _AddToCartCountWidgetState createState() => _AddToCartCountWidgetState();
}

class _AddToCartCountWidgetState extends State<AddToCartCountWidget> {
  int count;
  final _countController = TextEditingController();

  _changeItemCount(int newCount) {
    setState(() {
      count = newCount;
      widget._function(count);
    });
  }

  _quantityListener() {
    if (int.parse(_countController.text) == 0) {
      _countController.value = TextEditingValue(
          text: '1',
          selection: TextSelection.fromPosition(TextPosition(offset: 1)));
    }
  }

  @override
  void initState() {
    count = widget.initialCount;
    _countController.addListener(_quantityListener);
    super.initState();
  }

  @override
  void dispose() {
    _countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.isQuantity)
          Text("Quantity"),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  if (count > 1) _changeItemCount((count - 1));
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          (count <= 1) ? Colors.grey[100] : Colors.grey[400]),
                  child: Center(
                    child: Icon(
                      Icons.remove,
                      size: 14.0,
                      color: (count <= 1) ? Colors.black26 : Colors.black,
                    ),
                  ),
                ),
              ),
              InkWell(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      '$count',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  onTap: () {
                    _countController.value = TextEditingValue(
                        text: '$count',
                        selection: TextSelection.fromPosition(
                            TextPosition(offset: '$count'.length)));
                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                              title: Text('Enter Quantity'),
                              titlePadding: EdgeInsets.all(24.0),
                              content: TextField(
                                keyboardType: TextInputType.number,
                                controller: _countController,
                                maxLength: 4,
                                autofocus: true,
                                decoration: InputDecoration(
                                    hintText: 'Please input quantity'),
                              ),
                              actions: [
                                FlatButton(
                                    child: Text(
                                      'OK',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(
                                          ctx,
                                          (_countController.text.length > 0)
                                              ? int.parse(_countController.text)
                                              : '');
                                    })
                              ],
                            )).then((value) {
                      if (value is int) {
                        _changeItemCount(value);
                      }
                    });
                  }),
              InkWell(
                onTap: () {
                  if (count < 9999) _changeItemCount((count + 1));
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (count == 9999)
                          ? Colors.grey[100]
                          : Colors.grey[400]),
                  child: Center(
                    child: Icon(
                      Icons.add,
                      size: 14.0,
                      color: (count == 9999) ? Colors.black26 : Colors.black,
                    ),
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
