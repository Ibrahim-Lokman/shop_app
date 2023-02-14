import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_app/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;

  ProductItem( 
    
      @required this.id,
      @required this.title,
      @required this.imageUrl
    
  );

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName, 
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.fill,
            ),
        ),
          footer: GridTileBar(
            backgroundColor: Color.fromARGB(198, 0, 0, 0),
            leading: IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.favorite),
              color: Theme.of(context).accentColor,
              ),
              title: Text(
                title,
                textAlign: TextAlign.center,
              ),
              trailing: IconButton(
                onPressed: (){}, 
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