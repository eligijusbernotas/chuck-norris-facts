import 'package:chuck_norris_facts/src/fact/fact.dart';
import 'package:chuck_norris_facts/src/fact/query/fact_query.dart';
import 'package:chuck_norris_facts/src/fact/repositories/fact_api_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final factProvider = FutureProvider.autoDispose<Fact>((ref) {
  final repository = ref.watch(factRespositoryProvider);
  final request = ref.watch(factQueryProvider);

  if (request.isPlainRandom) {
    return repository.getRandom();
  } else if (request.isCategorySet) {
    return repository.getRandom(category: request.category!);
  }

  return repository.getByQuery(request.searchQuery!);
});
