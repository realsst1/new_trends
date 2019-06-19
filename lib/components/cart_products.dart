import 'package:flutter/material.dart';

class CartProducts extends StatefulWidget {
  @override
  _CartProductsState createState() => _CartProductsState();
}

class _CartProductsState extends State<CartProducts> {

  var productsOnCart=[
    {
      "name":"Blazer",
      "picture":"images/products/blazer1.jpeg",
      "price":1999,
      "size":"M",
      "color":"Red",
      "quantity":1
    },
    {
      "name":"Red Dress",
      "picture":"images/products/dress1.jpeg",
      "price":1799,
      "size":"XL",
      "color":"Red",
      "quantity":1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: productsOnCart.length,
        itemBuilder: (context,i){
            return new SingleCartProduct(
              singleProductCartColor: productsOnCart[i]['color'],
              singleProductCartName: productsOnCart[i]['name'],
              singleProductCartPicture: productsOnCart[i]['picture'],
              singleProductCartPrice: productsOnCart[i]['price'],
              singleProductCartQuantity: productsOnCart[i]['quantity'],
              singleProductCartSize: productsOnCart[i]['size'],
            );
        }
    );
  }
}


class SingleCartProduct extends StatelessWidget {

  final singleProductCartName;
  final singleProductCartPrice;
  final singleProductCartSize;
  final singleProductCartColor;
  final singleProductCartQuantity;
  final singleProductCartPicture;

  SingleCartProduct({
      this.singleProductCartColor,
    this.singleProductCartName,
    this.singleProductCartPicture,
    this.singleProductCartPrice,
    this.singleProductCartQuantity,
    this.singleProductCartSize
  });


  @override
  Widget build(BuildContext context) {
    return Card(
      child: new ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        leading: Container(
          height: 100.0,
          width: 80.0,
          child: new Image.asset(
              singleProductCartPicture,
            fit: BoxFit.fill,
          ),
        ),
        title: new Text(singleProductCartName),
        subtitle: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: new Text(
                      singleProductCartSize,
                      style: new TextStyle(
                        color: Colors.blue,
                      ),
                  ),
                ),



                new Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                    child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: new Text(
                      singleProductCartColor,
                      style: new TextStyle(
                        color: Colors.blue
                      ),
                  ),
                ),
              ],
            ),


            Container(
              child: new Text(
                "Rs "+singleProductCartPrice.toString(),
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.blue
                ),
              ),
              alignment: Alignment.topLeft,
            )

          ],
        ),

        trailing: new Column(
          children: <Widget>[
            new IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){},),
            new Text(singleProductCartQuantity.toString()),
            new IconButton(icon: Icon(Icons.arrow_drop_down), onPressed: (){})
          ],
        ),
      ),
    );
  }
}

