import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:new_trends/components/horizontal_listview.dart';
import 'package:new_trends/components/products.dart';
import 'package:new_trends/pages/cart.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget imageCarousal=new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
      ),
    );


    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        title: Text("New Trends"),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: (){},
          ),
          new IconButton(
            icon: new Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>new Cart()));
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountEmail: new Text("shreyesh2008@gmail.com"),
              accountName: new Text("Shreyesh Sharma"),
              currentAccountPicture: new GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: new Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.blue
              ),
            ),
            new InkWell(
              onTap: (){},
              child: new ListTile(
                title: new Text("Home"),
                leading: new Icon(
                  Icons.home,
                  color: Colors.blue,
                ),
              ),
            ),
            new InkWell(
              onTap: (){},
              child: new ListTile(
                title: new Text("My Account"),
                leading: new Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
            ),
            new InkWell(
              onTap: (){},
              child: new ListTile(
                title: new Text("My Orders"),
                leading: new Icon(
                  Icons.shopping_basket,
                  color: Colors.blue,
                ),
              ),
            ),
            new InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> new Cart()));
              },
              child: new ListTile(
                title: new Text("Shopping Cart"),
                leading: new Icon(
                  Icons.shopping_cart,
                  color: Colors.blue,
                ),
              ),
            ),
            new InkWell(
              onTap: (){},
              child: new ListTile(
                title: new Text("Favourites"),
                leading: new Icon(
                  Icons.favorite,
                  color: Colors.blue,
                ),
              ),
            ),

            new Divider(),
            new InkWell(
              onTap: (){},
              child: new ListTile(
                title: new Text("Settings"),
                leading: new Icon(
                  Icons.settings,
                ),
              ),
            ),
            new InkWell(
              onTap: (){},
              child: new ListTile(
                title: new Text("About Us"),
                leading: new Icon(
                  Icons.help,
                ),
              ),
            )
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
            imageCarousal,
          new Padding(
            padding: EdgeInsets.all(8.0),
            child: new Text("Categories"),
          ),

          new HorizontalList(),
          
          new Padding(
            padding: EdgeInsets.all(8.0),
            child: new Text("Recent Products"),
          ),

          new Container(
            height: 320.0,
            child: Products(),
          )



        ],
      ),

    );
  }
}
