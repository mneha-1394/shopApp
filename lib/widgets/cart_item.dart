import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final id;
  final String productId;
  final double price;
  final int quantity;
  final String title;
  const CartItem(
      {Key? key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      required this.productId})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key:ValueKey(id),
      background: Container(
    color:Theme.of(context).colorScheme.secondary,
    alignment: Alignment.centerRight,
    padding: const EdgeInsets.only(right: 20),
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
    child: const Icon(Icons.delete,
    color:Colors.white,
    size: 40,),
),
direction: DismissDirection.endToStart,
confirmDismiss: (direction) {
   return showDialog(context: context, builder: (ctx)=>AlertDialog(
    title: const Text('Are You Sure?'),
    content: const Text('Do You want to remove item from the cart?'),
    actions: [
      TextButton(onPressed: (){
        Navigator.of(ctx).pop(false);
      }, child: const Text('NO')),
          TextButton(onPressed: (){
            Navigator.of(ctx).pop(true);
          }, child: const Text('YES'))
    ],
   ));
},
onDismissed: (direction){
  Provider.of<Cart>(context,listen: false).removeItem(productId);
},
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: FittedBox(child: Text('\$$price'))),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}