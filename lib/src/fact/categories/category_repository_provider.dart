import 'package:chuck_norris_facts/src/chopper_client.dart';
import 'package:chuck_norris_facts/src/fact/categories/repositories/category_api_repository.dart';
import 'package:chuck_norris_facts/src/fact/categories/repositories/category_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryRespositoryProvider = Provider<CategoryRepository>((ref) {
  final chopper = ref.watch(chopperProvider);

  return chopper.getService<CategoryApiRepository>();
});
