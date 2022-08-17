import '../widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
enum FilterOptions { favourites, all }

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({Key? key}) : super(key: key);


  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showFavouriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My shop"),
       actions: <Widget>[
        PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.favourites) {
                  _showFavouriteOnly = true;
                } else {
                  _showFavouriteOnly = false;
                }
              });
            },
             icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
                  const PopupMenuItem(
                      child: Text('Only Favourites'),
                      value: FilterOptions.favourites),
                  const PopupMenuItem(
                      child: Text('Show All'), value: FilterOptions.all)
                ]),
       Consumer<Cart>(
        builder:(_,cart,ch)=>
           Badge(
              child:ch as Widget,
              value:cart.itemCount.toString() ,
               ),
              child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                   onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routeName);
                   }),
        )
      ]),
      drawer: const AppDrawer(),
      body: ProductsGrid(
        showFavourites: _showFavouriteOnly,
      ),
    );
  }
}
