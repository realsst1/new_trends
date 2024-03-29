import 'package:flutter/material.dart';
import 'package:new_trends/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  var productList=[
    {
      "name":"Blazer",
      "picture":"images/products/blazer1.jpeg",
      "old_price":3499,
      "price":1999
    },
    {
      "name":"Red Dress",
      "picture":"images/products/dress1.jpeg",
      "old_price":2399,
      "price":1799
    },
    {
      "name":"Skirt",
      "picture":"images/products/skt1.jpeg",
      "old_price":1599,
      "price":1499
    },
    {
      "name":"Shoe",
      "picture":"images/products/shoe1.jpg",
      "old_price":2599,
      "price":1899
    },
    {
      "name":"Pants",
      "picture":"images/products/pants2.jpeg",
      "old_price":5499,
      "price":3999
    },
    {
      "name":"Skirt",
      "picture":"images/products/skt2.jpeg",
      "old_price":2399,
      "price":1999
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: productList.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context,int i){
          return SingleProduct(
            productName: productList[i]['name'],
            productPicture: productList[i]['picture'],
            oldPrice: productList[i]['old_price'],
            price: productList[i]['price'],
          );
        }
    );
  }
}

class SingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final oldPrice;
  final price;

  SingleProduct({
    this.productName,
    this.productPicture,
    this.oldPrice,
    this.price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: new Text("hero 1"),
        child: new Material(
          child: InkWell(
            onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=>new ProductDetails(
                  productDetailsName: productName,
                  productDetailsOldPrice: oldPrice,
                  productDetailsPicture: productPicture,
                  productDetailsPrice: price,
                )
            )),
            child: new GridTile(
              footer: new Container(
                color: Colors.white70,
                child: new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Text(
                            productName,
                            style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0
                            ),
                        )
                    ),
                    new Text(
                        "Rs "+price.toString(),
                        style: new TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold
                        ),
                    )
                  ],
                ),
              ),
              child: Image.asset(
                productPicture,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
