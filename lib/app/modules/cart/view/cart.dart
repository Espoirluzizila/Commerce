import 'package:flutter/material.dart';
import '../../../../state/app_state.dart';
import '../../../../widgets/cart_item_tile.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  void _goCheckout(BuildContext context) => Navigator.pushNamed(context, '/checkout');

  @override
  Widget build(BuildContext context) {
    final app = AppStateScope.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Panier')),
      body: app.cart.isEmpty
          ? const Center(child: Text('Votre panier est vide'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: app.cart.length,
                    itemBuilder: (context, i) {
                      final item = app.cart[i];
                      return CartItemTile(
                        item: item,
                        onInc: () => app.updateQty(item.product, item.quantity + 1),
                        onDec: () => app.updateQty(item.product, item.quantity - 1),
                        onRemove: () => app.removeFromCart(item.product),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total', style: Theme.of(context).textTheme.titleLarge),
                      Text('${app.totalPrice.toStringAsFixed(2)} €',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                SafeArea(
                  minimum: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => _goCheckout(context),
                      child: const Text('Passer au paiement'),
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
