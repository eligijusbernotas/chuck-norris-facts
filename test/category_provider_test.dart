import 'package:chuck_norris_facts/src/fact/categories/categories_provider.dart';
import 'package:chuck_norris_facts/src/fact/categories/category_repository_provider.dart';
import 'package:chuck_norris_facts/src/fact/categories/repositories/fake_category_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Category provider', () {
    test('Fetching categories from provider returns expected categories', () async {
      final container = ProviderContainer(overrides: [
        categoryRespositoryProvider.overrideWithValue(FakeCategoryRepository()),
      ]);

      expect(
        container.read(categoriesProvider),
        const AsyncValue<List<String>>.loading(),
      );

      await container.read(categoriesProvider.future);

      expect(
        container.read(categoriesProvider).value,
        isA<List<String>>(),
      );
      expect(
        container.read(categoriesProvider).value,
        containsAll(FakeCategoryRepository.categories),
      );
    });
  });
}
