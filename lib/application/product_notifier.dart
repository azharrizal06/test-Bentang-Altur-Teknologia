import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:test_bentang_altur/data/product_repository.dart';
import 'package:test_bentang_altur/domain/product_model.dart';

class ProductState {
  final List<Product> all;
  final List<Product> items;
  final bool isLoading;
  final String? error;
  final int page;
  final bool hasMore;
  final String query;

  const ProductState({
    this.all = const [],
    this.items = const [],
    this.isLoading = false,
    this.error,
    this.page = 0,
    this.hasMore = true,
    this.query = '',
  });

  ProductState copyWith({
    List<Product>? all,
    List<Product>? items,
    bool? isLoading,
    String? error,
    int? page,
    bool? hasMore,
    String? query,
  }) {
    return ProductState(
      all: all ?? this.all,
      items: items ?? this.items,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      query: query ?? this.query,
    );
  }
}

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductRepository repo;
  static const int pageSize = 10;

  ProductNotifier(this.repo) : super(const ProductState());

  Future<void> loadProducts() async {
    if (state.all.isNotEmpty) return;
    state = state.copyWith(isLoading: true, error: null);
    try {
      final list = await repo.fetchAllProducts();
      final initial = list.take(pageSize).toList();
      state = state.copyWith(
        all: list,
        items: initial,
        page: 1,
        hasMore: list.length > initial.length,
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> refresh() async {
    state = state.copyWith(
      isLoading: true,
      error: null,
      all: [],
      items: [],
      page: 0,
      hasMore: true,
    );
    await loadProducts();
  }

  Future<void> loadMore() async {
    if (state.isLoading || !state.hasMore || state.query.isNotEmpty) return;
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(milliseconds: 300));
    final start = state.page * pageSize;
    final end = start + pageSize;
    final more = state.all.length > start
        ? state.all.sublist(
            start,
            state.all.length > end ? end : state.all.length,
          )
        : <Product>[];
    final newItems = List<Product>.from(state.items)..addAll(more);
    state = state.copyWith(
      items: newItems,
      page: state.page + 1,
      hasMore: state.all.length > newItems.length,
      isLoading: false,
    );
  }

  void search(String q) {
    final query = q.trim();
    if (query.isEmpty) {
      final initial = state.all.take(pageSize).toList();
      state = state.copyWith(
        items: initial,
        page: 1,
        hasMore: state.all.length > initial.length,
        query: '',
      );
      return;
    }
    final filtered = state.all
        .where((p) => p.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    state = state.copyWith(
      items: filtered,
      page: 1,
      hasMore: false,
      query: query,
    );
  }
}

final productRepositoryProvider = Provider((ref) => ProductRepository());

final productNotifierProvider =
    StateNotifierProvider<ProductNotifier, ProductState>((ref) {
      final repo = ref.read(productRepositoryProvider);
      return ProductNotifier(repo);
    });
