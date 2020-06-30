import 'package:aliexpress/helpers/extentions.dart';
import 'package:aliexpress/models/cart_data.dart';
import 'package:aliexpress/providers/cart.dart';
import 'package:aliexpress/providers/products.dart';
import 'package:aliexpress/ui/widgets/cart_item.dart';
import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:expandable_bottom_bar/expandable_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = '/cart_screen';

  @override
  _CartScreenState createState() => _CartScreenState();
}


class _CartScreenState extends State<CartScreen> {

  @override
  void dispose() {
    Provider.of<Cart>(context, listen: false).deleteSelectedItems();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Cart(${provider.items.length})',
          style: TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        actions: [
          BouncingWidget(
            onPressed: () {
              if(provider.selectedItemsCount > 0){
                showDialog(context: context, builder: (ctx) => AlertDialog(
                  title: Text("Remove", style: TextStyle(fontSize: 16.0),),
                  content: Text("Are you sure you want to remove the items selected?"),
                  contentPadding: EdgeInsets.all(16.0),
                  actions: [
                    FlatButton(
                        child: Text(
                          'Cancel',
                          style: TextStyle(color: Colors.red, fontSize: 16.0),
                        ),
                        onPressed: () {
                          Navigator.pop(
                              ctx, false);
                        }),
                    FlatButton(
                        child: Text(
                          'Remove',
                          style: TextStyle(color: Colors.red, fontSize: 16.0),
                        ),
                        onPressed: () {
                          Navigator.pop(
                              ctx, true);
                        }),
                  ],
                )).then((value){
                  if(value is bool){
                    if(value){
                      provider.deleteSelectedItems();
                    }
                  }
                });
              }else{
                ShowToast('Please select product options first').showToast(context);
              }
            },
            duration: Duration(milliseconds: 200),
            scaleFactor: -2.0,
            child: Container(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.delete_outline, color: Colors.red, size: 30.0,),
            ),
          ),
          ],
      ),
      body: ListView.separated(
          itemBuilder: (ctx, index) => CartItem(List<String>.from(provider.items.keys)[index]),
          separatorBuilder: (ctx, index) => Divider(
                height: 1.0,
              ),
          itemCount: provider.itemCount),
      bottomNavigationBar: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: provider.isSelectedAllItems,
                      onChanged: (value) => provider.selectAllItems(value)),
                  Text('All')
                ],
              ),
              InkWell(
//                  onTap: _closeBottomSheet,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "US \$${provider.resultPrice}",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 16.0),
                    ),
                  ],
                ),
              ),
              BouncingWidget(
                onPressed: () {},
                duration: Duration(milliseconds: 100),
                scaleFactor: -1.5,
                child: Card(
                  elevation: 4.0,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(color: Colors.red),
                    child: Text(
                      "CHECK OUT (${provider.selectedItemsCount})",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
