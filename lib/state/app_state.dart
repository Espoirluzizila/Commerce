import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';
import '../models/cart_item.dart';
import '../data/sample_data.dart';

class AppState extends ChangeNotifier {
  final List<CartItem> _cart = [];
  final Set<String> _wishlist = {};

  List<CartItem> get cart => List.unmodifiable(_cart);
  Set<String> get wishlist => Set.unmodifiable(_wishlist);

  int get itemsCount => _cart.fold(0, (s, i) => s + i.quantity);
  double get totalPrice => _cart.fold(0.0, (s, i) => s + i.product.price * i.quantity);

  // search & filter
  String _query = '';
  String _category = 'Tous';
  String get query => _query;
  String get category => _category;

  List<Product> get filteredProducts {
    final all = SampleData.products;
    return all.where((p) {
      final q = _query.trim().toLowerCase();
      final matchQuery = q.isEmpty || p.name.toLowerCase().contains(q) || p.description.toLowerCase().contains(q);
      final matchCat = _category == 'Tous' || p.category == _category;
      return matchQuery && matchCat;
    }).toList();
  }

  void setQuery(String q) {
    _query = q;
    notifyListeners();
  }

  void setCategory(String c) {
    _category = c;
    notifyListeners();
  }

  void addToCart(Product p) {
    final idx = _cart.indexWhere((ci) => ci.product.id == p.id);
    if (idx >= 0) {
      _cart[idx].quantity += 1;
    } else {
      _cart.add(CartItem(product: p));
    }
    _saveCart();
    notifyListeners();
  }

  void removeFromCart(Product p) {
    _cart.removeWhere((ci) => ci.product.id == p.id);
    _saveCart();
    notifyListeners();
  }

  void updateQty(Product p, int q) {
    if (q <= 0) {
      removeFromCart(p);
      return;
    }
    final idx = _cart.indexWhere((ci) => ci.product.id == p.id);
    if (idx >= 0) {
      _cart[idx].quantity = q;
    }
    _saveCart();
    notifyListeners();
  }

  void toggleWishlist(Product p) {
    if (_wishlist.contains(p.id)) {
      _wishlist.remove(p.id);
    } else {
      _wishlist.add(p.id);
    }
    _saveWishlist();
    notifyListeners();
  }

  bool isWished(Product p) => _wishlist.contains(p.id);

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    // load wishlist
    final wish = prefs.getStringList('wishlist') ?? [];
    _wishlist
      ..clear()
      ..addAll(wish);
    // load cart
    final cartRaw = prefs.getString('cart');
    _cart.clear();
    if (cartRaw != null) {
      final list = jsonDecode(cartRaw) as List;
      for (final m in list) {
        final map = Map<String, dynamic>.from(m);
        final id = map['id'] as String;
        final qty = (map['qty'] as num).toInt();
        final prod = SampleData.products.firstWhere(
          (p) => p.id == id,
          orElse: () => SampleData.products.first,
        );
        _cart.add(CartItem(product: prod, quantity: qty));
      }
    }
    notifyListeners();
  }

  Future<void> _saveWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('wishlist', _wishlist.toList());
  }

  Future<void> _saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(_cart.map((e) => e.toJson()).toList());
    await prefs.setString('cart', encoded);
  }

  void clearCart() {
    _cart.clear();
    _saveCart();
    notifyListeners();
  }
}

class AppStateScope extends InheritedNotifier<AppState> {
  const AppStateScope({super.key, required AppState notifier, required Widget child})
      : super(notifier: notifier, child: child);

  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppStateScope>();
    assert(scope != null, 'AppStateScope not found');
    return scope!.notifier!;
  }
}
