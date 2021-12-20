import 'package:chopper/chopper.dart';
import 'package:chuck_norris_facts/src/chopper_client.dart';
import 'package:chuck_norris_facts/src/fact/fact.dart';
import 'package:chuck_norris_facts/src/fact/repositories/fact_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'fact_api_repository.chopper.dart';

final factRespositoryProvider = Provider<FactRepository>((ref) {
  final chopper = ref.watch(chopperProvider);

  return chopper.getService<FactApiRepository>();
});

@ChopperApi(baseUrl: '')
abstract class FactApiRepository extends ChopperService with FactRepository {
  static FactApiRepository create([ChopperClient? client]) => _$FactApiRepository(client);

  @override
  @Get(path: '/random')
  Future<Fact> getRandom({@Query() String? category});

  @override
  @Get(path: '/random')
  Future<Fact> getByQuery(@Query() String query);
}
