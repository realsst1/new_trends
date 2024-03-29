import 'package:flutter/material.dart';
import 'package:new_trends/pages/home.dart';

class ProductDetails extends StatefulWidget {

  final productDetailsPrice;
  final productDetailsName;
  final productDetailsOldPrice;
  final productDetailsPicture;

  ProductDetails({
    this.productDetailsName,
    this.productDetailsOldPrice,
    this.productDetailsPicture,
    this.productDetailsPrice
  });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: new InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> new HomePage()));
          },
            child: Text("New Trends")
        ),
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
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: new GridTile(
              child:new Container(
                color: Colors.white,
                child: Image.asset(widget.productDetailsPicture),
              ),
              footer: new Container(
                color: Colors.white70,
                child: new ListTile(
                  leading: new Text(
                      widget.productDetailsName,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0
                      ),
                  ),
                  title: new Row(
                    children: <Widget>[
                      new Expanded(
                        child:new Text(
                            "Rs "+widget.productDetailsOldPrice.toString(),
                            style: new TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough
                            ),
                        )
                      ),
                      new Expanded(
                        child: new Text(
                            "Rs "+widget.productDetailsPrice.toString(),
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue
                              ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new MaterialButton(
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (context){
                          return new AlertDialog(
                              title: new Text("Size"),
                              content: new Text("Choose the size"),
                              actions: <Widget>[
                                new MaterialButton(
                                    onPressed: (){
                                      Navigator.of(context).pop(context);
                                    },
                                    child:new Text("CLOSE") ,
                                )
                              ],
                          );
                        }
                      );
                    },
                  elevation: 0.1,
                    color: Colors.white,
                  textColor: Colors.grey,
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Text("Size"),
                      ),
                      new Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),

              new Expanded(
                child: new MaterialButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Colors"),
                            content: new Text("Choose the color"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                child:new Text("CLOSE") ,
                              )
                            ],
                          );
                        }
                    );
                  },
                  elevation: 0.1,
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Text("Color"),
                      ),
                      new Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              ),

              new Expanded(
                child: new MaterialButton(
                  onPressed: (){
                    showDialog(
                        context: context,
                        builder: (context){
                          return new AlertDialog(
                            title: new Text("Quantity"),
                            content: new Text("Choose the Quantity"),
                            actions: <Widget>[
                              new MaterialButton(
                                onPressed: (){
                                  Navigator.of(context).pop(context);
                                },
                                child:new Text("CLOSE") ,
                              )
                            ],
                          );
                        }
                    );
                  },
                  elevation: 0.1,
                  color: Colors.white,
                  textColor: Colors.grey,
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new Text("Qty"),
                      ),
                      new Expanded(
                        child: new Icon(Icons.arrow_drop_down),
                      )
                    ],
                  ),
                ),
              )

            ],
          ),

          new Row(
            children: <Widget>[
              new Expanded(
                child: new MaterialButton(
                    onPressed: (){},
                    color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 0.1,
                  child: new Text("Buy Now"),
                ),
              ),
              new IconButton(
                  icon: new Icon(Icons.add_shopping_cart),
                  color: Colors.blue,
                  onPressed: (){}
              ),
              new IconButton(icon: new Icon(Icons.favorite_border),color: Colors.blue, onPressed: (){})
            ],
          ),

          Divider(),

          new ListTile(
            title: new Text("Product Details"),
            subtitle: new Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),

          ),

          Divider(),

          new Row(
            children: <Widget>[
              new Padding(
                  padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                  child: new Text(
                    "Product Name",
                    style: new TextStyle(
                      color: Colors.grey
                    ),
                  ),
              ),
              new Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.productDetailsName),
              )
            ],
          ),

          new Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                child: new Text(
                  "Product Brand",
                  style: new TextStyle(
                      color: Colors.grey
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("Brand X"),
              )
            ],
          ),

          new Row(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.fromLTRB(12.0,5.0,5.0,5.0),
                child: new Text(
                  "Product Condition",
                  style: new TextStyle(
                      color: Colors.grey
                  ),
                ),
              ),
              new Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text("New"),
              )
            ],
          ),

          new Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text("Similar Products"),
          ),
          new Container(
            height: 400.0,
            child: SimilarProducts(),
          )
        ],
      )
    );
  }
}

class SimilarProducts extends StatefulWidget {
  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {

  var productList=[
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
          return SimilarSingleProduct(
            productName: productList[i]['name'],
            productPicture: productList[i]['picture'],
            oldPrice: productList[i]['old_price'],
            price: productList[i]['price'],
          );
        }
    );
  }
}


class SimilarSingleProduct extends StatelessWidget {
  final productName;
  final productPicture;
  final oldPrice;
  final price;

  SimilarSingleProduct({
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
