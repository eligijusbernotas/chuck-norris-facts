import 'package:chuck_norris_facts/src/fact/query/fact_query.dart';
import 'package:chuck_norris_facts/src/fact/query/fact_query_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class Listener extends Mock {
  void call();
}

main() {
  group('Fact query notifier', () {
    test('Setting search query notifies listeners and sets query', () {
      final container = ProviderContainer();
      final listener = Listener();

      addTearDown(container.dispose);

      container.listen<FactQuery>(
        factQueryProvider,
        (_, __) => listener(),
        fireImmediately: true,
      );

      verify(listener()).called(1);
      verifyNoMoreInteractions(listener);

      expect(container.read(factQueryProvider).isCategorySet, false);
      expect(container.read(factQueryProvider).isPlainRandom, true);
      expect(container.read(factQueryProvider).isQuerySet, false);

      container.read(factQueryProvider.notifier).setQuery('query');

      verify(listener()).called(1);
      verifyNoMoreInteractions(listener);

      expect(container.read(factQueryProvider).isCategorySet, false);
      expect(container.read(factQueryProvider).isPlainRandom, false);
      expect(container.read(factQueryProvider).isQuerySet, true);
      expect(container.read(factQueryProvider).searchQuery, 'query');
    });
    test('Setting category notifies listeners and sets category', () {
      final container = ProviderContainer();
      final listener = Listener();

      addTearDown(container.dispose);

      container.listen<FactQuery>(
        factQueryProvider,
        (_, __) => listener(),
        fireImmediately: true,
      );

      verify(listener()).called(1);
      verifyNoMoreInteractions(listener);

      expect(container.read(factQueryProvider).isCategorySet, false);
      expect(container.read(factQueryProvider).isPlainRandom, true);
      expect(container.read(factQueryProvider).isQuerySet, false);

      container.read(factQueryProvider.notifier).setCategory('dev');

      verify(listener()).called(1);
      verifyNoMoreInteractions(listener);

      expect(container.read(factQueryProvider).isCategorySet, true);
      expect(container.read(factQueryProvider).isPlainRandom, false);
      expect(container.read(factQueryProvider).isQuerySet, false);
      expect(container.read(factQueryProvider).category, 'dev');
    });
  });
}
