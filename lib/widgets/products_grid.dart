import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData =  Provider.of<ProductsProvider>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
  
    return GridView.builder(
      padding: EdgeInsets.all(10) ,
      itemCount: products.length,
      
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i] ,
        child: ProductItem(

        ),
          /*
          products[i].id, 
           products[i].title, 
           products[i].imageUrl,
          */
          ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ), 
      );
  }
}