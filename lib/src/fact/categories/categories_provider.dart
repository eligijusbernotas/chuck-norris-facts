import 'package:chuck_norris_facts/src/fact/categories/category_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider = FutureProvider<List<String>>((ref) async {
  final repository = ref.watch(categoryRespositoryProvider);

  return await repository.getCategories();
});
