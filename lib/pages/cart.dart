import 'package:flutter/material.dart';
import 'package:new_trends/components/cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  new AppBar(
        elevation: 0.0,
        title: Text("Shopping Cart"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
        ],
      ),

      body: new CartProducts(),

      bottomNavigationBar: new Container(
        color: Colors.white,
        child: new Row(
          children: <Widget>[
            new Expanded(
              child: new ListTile(
                title: new Text("Total"),
                subtitle: new Text("Rs 1599"),
              ),
            ),
            new Expanded(
              child: new MaterialButton(
                color: Colors.blue,
                child: new Text("Check Out",style: new TextStyle(color: Colors.white),),
                  onPressed: (){}
                  ),
            )
          ],
        ),
      ),
    );
  }
}
