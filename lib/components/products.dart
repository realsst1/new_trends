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
        tag: productName,
        child: new Material(
          child: InkWell(
            onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=>new ProductDetails()
            )),
            child: new GridTile(
              footer: new Container(
                color: Colors.white70,
                child: new ListTile(
                  leading: new Text(
                      productName,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  title: new Text(
                      "Rs"+price.toString(),
                      style: new TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.blue
                      ),
                  ),
                  subtitle: new Text(
                    "Rs"+oldPrice.toString(),
                    style: new TextStyle(
                      fontWeight: FontWeight.w800,
                      color: Colors.black54,
                      decoration:TextDecoration.lineThrough
                    ),
                  ),
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
