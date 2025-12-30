import 'package:flutter/material.dart';
import '../../../../state/app_state.dart';
import '../../../../data/sample_data.dart';
import '../../../../models/product.dart';
import '../../../../widgets/product_card.dart';

class Catalog extends StatelessWidget {
  const Catalog({super.key});

  void _openCart(BuildContext context) => Navigator.pushNamed(context, '/cart');
  void _openWishlist(BuildContext context) => Navigator.pushNamed(context, '/wishlist');
  void _openDetail(BuildContext context, Product p) => Navigator.pushNamed(context, '/product', arguments: p);

  @override
  Widget build(BuildContext context) {
    final app = AppStateScope.of(context);
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 700;
    final cross = isWide ? 4 : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Catalogue'),
        actions: [
          IconButton(onPressed: () => _openWishlist(context), icon: const Icon(Icons.favorite_border)),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(onPressed: () => _openCart(context), icon: const Icon(Icons.shopping_cart_outlined)),
              if (app.itemsCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Text('${app.itemsCount}', style: const TextStyle(color: Colors.white, fontSize: 12)),
                  ),
                )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Rechercher un produit...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: app.setQuery,
                  ),
                ),
                const SizedBox(width: 12),
                DropdownButton<String>(
                  value: app.category,
                  items: SampleData.categories
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
                  onChanged: (v) => app.setCategory(v ?? 'Tous'),
                )
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cross,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemCount: app.filteredProducts.length,
              itemBuilder: (context, i) {
                final p = app.filteredProducts[i];
                return ProductCard(
                  product: p,
                  onTap: () => _openDetail(context, p),
                  onWish: () => app.toggleWishlist(p),
                  wished: app.isWished(p),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
