import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';
import '../providers/product.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
 var _showOnlyFavorites = false;
 
  @override
  Widget build(BuildContext context) {
    // final productContainer = Provider.of<ProductsProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              
              setState(() {
                 if(selectedValue == FilterOptions.Favorites){
                   // productContainer.showFavoritesOnly();
                  _showOnlyFavorites = true;
                } else {
                   // productContainer.showAll();
                  _showOnlyFavorites = false;
                }
              });
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
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
