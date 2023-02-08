import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initail commit
      title: 'SHOP APP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
