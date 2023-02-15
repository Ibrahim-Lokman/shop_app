import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {

/*
  final String id;
  final String title;
  final String imageUrl;

  ProductItem( 
    
      @required this.id,
      @required this.title,
      @required this.imageUrl
    
  );
*/
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen : false);
    final cart = Provider.of<CartProvider>(context, listen : false);

    print('hello');
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName, 
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.fill,
            ),
        ),
          footer: GridTileBar(
            backgroundColor: Color.fromARGB(198, 0, 0, 0),
            leading: Consumer<Product>(
              builder: (ctx, product, child) => IconButton(
                onPressed: (){
                  product.toggleFavoriteStatus();
                }, 
                icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
                color: Theme.of(context).accentColor,
                ),
            ),
              title: Text(
                product.title,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                onPressed: (){
                  cart.addItem(product.id, product.price, product.title);
                }, 
                icon: Icon(
                  Icons.shopping_cart
                  ),
                color: Theme.of(context).accentColor,
              ),
          ),
        ),
    );
  }
}