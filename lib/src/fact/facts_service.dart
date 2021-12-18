import 'package:chopper/chopper.dart';
import 'package:chuck_norris_facts/src/chopper_client.dart';
import 'package:chuck_norris_facts/src/fact/fact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

part 'facts_service.chopper.dart';

final factsServiceProvider = Provider((ref) {
  final chopper = ref.watch(chopperProvider);

  return chopper.getService<FactsService>();
});

@ChopperApi(baseUrl: '')
abstract class FactsService extends ChopperService {
  static FactsService create([ChopperClient? client]) => _$FactsService(client);

  @Get(path: '/random')
  Future<Response<Fact>> getRandom({@Query() String? category});

  @Get(path: '/random')
  Future<Response<Fact>> getByQuery(@Query() String query);
}
