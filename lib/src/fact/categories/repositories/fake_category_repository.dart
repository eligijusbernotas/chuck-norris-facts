import 'package:chuck_norris_facts/src/fact/categories/repositories/category_repository.dart';

class FakeCategoryRepository extends CategoryRepository {
  static const categories = ['dev', 'food', 'fashion'];

  @override
  Future<List<String>> getCategories() => Future.value(categories);
}
