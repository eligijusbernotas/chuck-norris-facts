import 'package:chuck_norris_facts/src/fact/query/fact_query.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final factQueryProvider = StateNotifierProvider<FactQueryNotifier, FactQuery>((ref) {
  return FactQueryNotifier();
});
