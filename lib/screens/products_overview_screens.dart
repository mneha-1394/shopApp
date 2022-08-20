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
                      value: FilterOptions.favourites,
                      child: Text('Only Favourites')),
                  const PopupMenuItem(
                      value: FilterOptions.all,
                      child: Text('Show All'))
                ]),
       Consumer<Cart>(
        builder:(_,cart,ch)=>
           Badge(
              value:cart.itemCount.toString() ,
              child:ch as Widget,
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
