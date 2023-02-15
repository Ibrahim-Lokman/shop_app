import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create : (ctx) => ProductsProvider(), 
          ),
        ChangeNotifierProvider(
          create : (ctx) => CartProvider(), 
          ),

      ],
      child: MaterialApp(
        title: 'SHOP APP',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
          accentColor: Color.fromARGB(255, 214, 131, 104),
          fontFamily: 'Lato',
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
