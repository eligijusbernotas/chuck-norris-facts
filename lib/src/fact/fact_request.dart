import 'package:flutter_riverpod/flutter_riverpod.dart';

final factRequestProvider = StateNotifierProvider<FactRequestNotifier, FactRequest>((ref) {
  return FactRequestNotifier();
});

class FactRequestNotifier extends StateNotifier<FactRequest> {
  FactRequestNotifier() : super(const FactRequest());

  void setCategory(String category) => state = FactRequest(category: category);
  void setQuery(String query) => state = FactRequest(query: query);
  void repeat() => state = FactRequest(category: state.category, query: state.query);
}

class FactRequest {
  final String? category;
  final String? query;

  const FactRequest({
    this.category,
    this.query,
  });

  bool get isPlainRandom => !isCategorySet && !isQuerySet;

  bool get isCategorySet => category?.isNotEmpty ?? false;

  bool get isQuerySet => query?.isNotEmpty ?? false;
}
