import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../screens/products_overview_screens.dart';
import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'providers/cart.dart';
import '../screens/cart_screen.dart';
import '../providers/orders.dart';
import '../screens/order_screen.dart';
import '../screens/user_product_screen.dart';
import '../screens/edit_product_screen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
@override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(
        create:((context) => Products())),
         ChangeNotifierProvider(
        create:(context) =>  Cart(),),
        ChangeNotifierProvider(
          create: ((context) => Orders()),
        )
      ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
          title: 'MyShop',
          theme: ThemeData(
            primarySwatch: Colors.purple,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: Colors.deepOrange
            ),
            appBarTheme: const AppBarTheme(backgroundColor: Colors.purple)
          ),
          home:  const ProductsOverviewScreen(),
          routes: {
            ProductDetailScreen.routeName:(ctx)=> const ProductDetailScreen(),
          CartScreen.routeName:(ctx)=> const CartScreen(),
          OrdersScreen.routeName:(ctx)=> const OrdersScreen(),
          UserProductsScreen.routeName:(ctx) =>const UserProductsScreen(),
          EditProductScreen.routeName:(ctx)=> const EditProductScreen()
          },
        ));
  }
}