import '../models/product.dart';

class SampleData {
  static const categories = [
    'Tous',
    'Vêtements',
    'Chaussures',
    'Accessoires',
    'Tech',
  ];

  static final products = <Product>[
    Product(
      id: 'p1',
      name: 'T-shirt Unisexe',
      description: 'T-shirt 100% coton, coupe moderne.',
      price: 14.99,
      imageUrl: 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?q=80&w=1200&auto=format&fit=crop',
      category: 'Vêtements',
    ),
    Product(
      id: 'p2',
      name: 'Sneakers street',
      description: 'Baskets légères et confortables.',
      price: 69.90,
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1200&auto=format&fit=crop',
      category: 'Chaussures',
    ),
    Product(
      id: 'p3',
      name: 'Montre connectée',
      description: 'Suivi d’activité et notifications.',
      price: 89.50,
      imageUrl: 'https://images.unsplash.com/photo-1516570161787-2fd917215a3d?q=80&w=1200&auto=format&fit=crop',
      category: 'Tech',
    ),
    Product(
      id: 'p4',
      name: 'Sac à dos urbain',
      description: 'Compartiment laptop 15\'', résistant à l’eau.',
      price: 39.99,
      imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?q=80&w=1200&auto=format&fit=crop',
      category: 'Accessoires',
    ),
    Product(
      id: 'p5',
      name: 'Casque Bluetooth',
      description: 'Réduction de bruit, 30h autonomie.',
      price: 59.99,
      imageUrl: 'https://images.unsplash.com/photo-1518441982124-5f3bc1d2ca04?q=80&w=1200&auto=format&fit=crop',
      category: 'Tech',
    ),
  ];
}
