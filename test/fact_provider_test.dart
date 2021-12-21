import 'package:chuck_norris_facts/src/fact/fact.dart';
import 'package:chuck_norris_facts/src/fact/fact_provider.dart';
import 'package:chuck_norris_facts/src/fact/query/fact_query_provider.dart';
import 'package:chuck_norris_facts/src/fact/repositories/fact_api_repository.dart';
import 'package:chuck_norris_facts/src/fact/repositories/fake_fact_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Fact provider', () {
    test('Fetching fact by category from provider returns fact', () async {
      final container = ProviderContainer(overrides: [
        factRespositoryProvider.overrideWithValue(FakeFactRepository()),
      ]);

      container.read(factQueryProvider.notifier).setCategory('dev');

      expect(
        container.read(factProvider),
        const AsyncValue<Fact>.loading(),
      );

      await container.read(factProvider.future);

      expect(
        container.read(factProvider).value,
        isA<Fact>().having(
          (f) => f.id,
          'id',
          FakeFactRepository.categoryFact.id,
        ),
      );
    });
    test('Fetching fact by search query from provider returns fact', () async {
      final container = ProviderContainer(overrides: [
        factRespositoryProvider.overrideWithValue(FakeFactRepository()),
      ]);

      //TODO: Might be a problem, look into properly faking StateNotifierProvider
      container.read(factQueryProvider.notifier).setQuery('query');

      expect(
        container.read(factProvider),
        const AsyncValue<Fact>.loading(),
      );

      await container.read(factProvider.future);

      expect(
        container.read(factProvider).value,
        isA<Fact>().having(
          (f) => f.id,
          'id',
          FakeFactRepository.searchFact.id,
        ),
      );
    });
    test('Fetching fact with no parameters from provider returns a random fact', () async {
      final container = ProviderContainer(overrides: [
        factRespositoryProvider.overrideWithValue(FakeFactRepository()),
      ]);

      expect(
        container.read(factProvider),
        const AsyncValue<Fact>.loading(),
      );

      await container.read(factProvider.future);

      expect(
        container.read(factProvider).value,
        isA<Fact>().having(
          (f) => f.id,
          'id',
          FakeFactRepository.randomFact.id,
        ),
      );
    });
  });
}
