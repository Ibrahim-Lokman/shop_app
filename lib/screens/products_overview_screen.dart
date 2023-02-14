import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import '../providers/product.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              if(selectedValue == FilterOptions.Favorites){
                productContainer.showFavoritesOnly();
              } else {
                productContainer.showAll();
              }
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Only Favorite'), value : FilterOptions.Favorites,),
              PopupMenuItem(child: Text('All'), value : FilterOptions.All,),

            ],
            )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
