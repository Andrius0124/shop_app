import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";
  const CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Text(
                  "Total",
                  style: TextStyle(fontSize: 20),
                ),
                Spacer(),
                Chip(
                  label: Text(
                    '\$${cart.totalAmout}',
                    style: TextStyle(
                      color: Theme.of(context).primaryTextTheme.title.color,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                FlatButton(
                  child: Text("ORDER NOW"),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemNumber,
              itemBuilder: (BuildContext context, int index) {
                return CartItem(
                  id: cart.items.values.toList()[index].id,
                  price: cart.items.values.toList()[index].price,
                  quantity: cart.items.values.toList()[index].quantity,
                  title: cart.items.values.toList()[index].title,
                  productId: cart.items.keys.toList()[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
