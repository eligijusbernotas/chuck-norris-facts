import 'package:chopper/chopper.dart';
import 'package:chuck_norris_facts/src/categories/categories_service.dart';
import 'package:chuck_norris_facts/src/fact/fact.dart';
import 'package:chuck_norris_facts/src/fact/facts_service.dart';
import 'package:chuck_norris_facts/src/utils/json_serializable_converter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chopperProvider = Provider<ChopperClient>((ref) {
  const converter = JsonSerializableConverter({
    Fact: Fact.fromJsonFactory,
  });

  return ChopperClient(
    baseUrl: 'https://api.chucknorris.io/jokes',
    converter: converter,
    errorConverter: converter,
    services: [
      CategoriesService.create(),
      FactsService.create(),
    ],
  );
});
