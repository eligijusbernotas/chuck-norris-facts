import 'package:flutter_riverpod/flutter_riverpod.dart';

final factQueryProvider = StateNotifierProvider<FactQueryNotifier, FactQuery>((ref) {
  return FactQueryNotifier();
});

class FactQueryNotifier extends StateNotifier<FactQuery> {
  FactQueryNotifier() : super(const FactQuery());

  void setCategory(String category) => state = FactQuery(category: category);
  void setQuery(String query) => state = FactQuery(searchQuery: query);
  void repeat() => state = FactQuery(category: state.category, searchQuery: state.searchQuery);
}

class FactQuery {
  final String? category;
  final String? searchQuery;

  const FactQuery({
    this.category,
    this.searchQuery,
  });

  bool get isPlainRandom => !isCategorySet && !isQuerySet;

  bool get isCategorySet => category?.isNotEmpty ?? false;

  bool get isQuerySet => searchQuery?.isNotEmpty ?? false;
}
