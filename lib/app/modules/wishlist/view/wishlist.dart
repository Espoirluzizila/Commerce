import 'package:flutter/material.dart';
import '../../../../state/app_state.dart';
import '../../../../data/sample_data.dart';
import '../../../../models/product.dart';
import '../../../../widgets/product_card.dart';

class WishlistView extends StatelessWidget {
  const WishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    final app = AppStateScope.of(context);
    final wished = app.wishlist;
    final prods = SampleData.products.where((p) => wished.contains(p.id)).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Favoris')),
      body: prods.isEmpty
          ? const Center(child: Text('Aucun favori'))
          : GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemCount: prods.length,
              itemBuilder: (context, i) {
                final p = prods[i];
                return ProductCard(
                  product: p,
                  onTap: () => Navigator.pushNamed(context, '/product', arguments: p),
                  onWish: () => app.toggleWishlist(p),
                  wished: true,
                );
              },
            ),
    );
  }
}
