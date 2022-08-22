
import '../widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../widgets/user_product_item.dart';
import '../screens/edit_product_screen.dart';
class UserProductsScreen extends StatelessWidget {
  static const routeName='/user';
  const UserProductsScreen({Key? key}) : super(key: key);
Future<void>_refreshProduct(BuildContext context) async{
   await Provider.of<Products>(context,listen:false).fetchAndSetProducts();
} 

  @override
  Widget build(BuildContext context) {

    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [IconButton(onPressed: () {
          Navigator.of(context).pushNamed(EditProductScreen.routeName);
        }, icon: const Icon(Icons.add))],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator (
        onRefresh:()=>_refreshProduct(context) ,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: ((_, index) => Column(
              children: [
                UserProductItem(
                     id:productsData.items[index].id,
                    title: productsData.items[index].title,
                    imageUrl: productsData.items[index].imageUrl),
                   const  Divider()
              ],
            )),
            itemCount: productsData.items.length,
          ),
        ),
      ),
    );
  }
}