import 'package:flutter/material.dart';
import '../../../../models/product.dart';
import '../../../../state/app_state.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    final app = AppStateScope.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(product.name), actions: [
        IconButton(
          onPressed: () => app.toggleWishlist(product),
          icon: Icon(app.isWished(product) ? Icons.favorite : Icons.favorite_border),
        )
      ]),
      body: ListView(
        children: [
          AspectRatio(
            aspectRatio: 1.3,
            child: Image.network(product.imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 8),
                Text('${product.price.toStringAsFixed(2)} €',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.green[700], fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Text(product.description),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () {
                    app.addToCart(product);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ajouté au panier')));
                  },
                  icon: const Icon(Icons.add_shopping_cart),
                  label: const Text('Ajouter au panier'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
