import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_item.dart';
import '../providers/products.dart';
class ProductsGrid extends StatelessWidget {
  final bool showFavourites;
  const ProductsGrid({
    Key? key,required this.showFavourites
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final productData=Provider.of<Products>(context);
    final products=showFavourites? productData.favoriteItems:productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //create: (c)=>products[i],
        value:products[i],
        child: const ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}