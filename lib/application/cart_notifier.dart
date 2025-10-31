import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../domain/product_model.dart';

class CartNotifier extends StateNotifier<List<Product>> {
  static const _prefsKey = 'cart_items';

  CartNotifier() : super([]) {
    Future.microtask(() => _load());
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_prefsKey) ?? [];
    final products = list.map((s) => Product.fromJsonString(s)).toList();
    state = products;
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    final list = state.map((p) => p.toJsonString()).toList();
    await prefs.setStringList(_prefsKey, list);
  }

  bool contains(Product p) => state.any((e) => e.id == p.id);

  Future<void> add(Product p) async {
    if (contains(p)) return;
    state = [...state, p];
    await _save();
  }

  Future<void> remove(Product p) async {
    state = state.where((e) => e.id != p.id).toList();
    await _save();
  }

  Future<void> clear() async {
    state = [];
    await _save();
  }
}

final cartProvider = StateNotifierProvider<CartNotifier, List<Product>>(
  (ref) => CartNotifier(),
);
