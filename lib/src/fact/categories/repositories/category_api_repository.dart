import 'package:chopper/chopper.dart';
import 'package:chuck_norris_facts/src/fact/categories/repositories/category_repository.dart';

part 'category_api_repository.chopper.dart';

@ChopperApi(baseUrl: '/categories')
abstract class CategoryApiRepository extends ChopperService with CategoryRepository {
  static CategoryApiRepository create([ChopperClient? client]) => _$CategoryApiRepository(client);

  @override
  @Get()
  Future<List<String>> getCategories();
}
