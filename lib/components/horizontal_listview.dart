import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: new ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          new Category(
            imageLocation: 'images/cats/accessories.png',
            imageCaption: "Accessories",
          ),
          new Category(
            imageLocation: 'images/cats/dress.png',
            imageCaption: "Dress",
          ),
          new Category(
            imageLocation: 'images/cats/formal.png',
            imageCaption: "Formal",
          ),
          new Category(
            imageLocation: 'images/cats/informal.png',
            imageCaption: "Casual",
          ),
          new Category(
            imageLocation: 'images/cats/jeans.png',
            imageCaption: "Jeans",
          ),
          new Category(
            imageLocation: 'images/cats/shoe.png',
            imageCaption: "Shoes",
          ),
          new Category(
            imageLocation: 'images/cats/tshirt.png',
            imageCaption: "T-Shirt",
          )
          
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {

  final String imageLocation;
  final String imageCaption;

  Category({
    this.imageCaption,
    this.imageLocation
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: new InkWell(
        onTap: (){},
        child: new Container(
          width: 110.0,
          child: new ListTile(
            title: Image.asset(
                imageLocation,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: new Container(child: new Text(imageCaption),alignment: Alignment.topCenter,),
          ),
        ),
      ),
    );
  }
}

