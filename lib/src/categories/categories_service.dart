import 'package:chopper/chopper.dart';

part 'categories_service.chopper.dart';

@ChopperApi(baseUrl: '/categories')
abstract class CategoriesService extends ChopperService {
  static CategoriesService create([ChopperClient? client]) => _$CategoriesService(client);

  @Get()
  Future<Response<List<String>>> getCategories();
}
