import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartItemTile extends StatelessWidget {
  final CartItem item;
  final VoidCallback onInc;
  final VoidCallback onDec;
  final VoidCallback onRemove;
  const CartItemTile({super.key, required this.item, required this.onInc, required this.onDec, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(item.product.imageUrl)),
      title: Text(item.product.name),
      subtitle: Text('${item.product.price.toStringAsFixed(2)} € x ${item.quantity}'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(onPressed: onDec, icon: const Icon(Icons.remove_circle_outline)),
          Text('${item.quantity}'),
          IconButton(onPressed: onInc, icon: const Icon(Icons.add_circle_outline)),
          IconButton(onPressed: onRemove, icon: const Icon(Icons.delete_outline)),
        ],
      ),
    );
  }
}
