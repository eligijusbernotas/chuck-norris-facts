import 'package:chuck_norris_facts/src/categories/categories_service.dart';
import 'package:chuck_norris_facts/src/chopper_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoriesProvider = FutureProvider<List<String>>((ref) async {
  final chopper = ref.watch(chopperProvider);
  final categoriesService = chopper.getService<CategoriesService>();

  final response = await categoriesService.getCategories();

  if (response.isSuccessful) {
    return response.body ?? [];
  } else {
    return [];
  }
});
