import 'package:flutter/material.dart';

import 'package:new_trends/pages/login.dart';

void main()=>runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Login(),
    );
  }
}
