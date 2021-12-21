import 'package:chuck_norris_facts/src/fact/fact.dart';
import 'package:chuck_norris_facts/src/fact/repositories/fact_repository.dart';

class FakeFactRepository extends FactRepository {
  static const randomFact = Fact(
    'lxygnv_ctv-39bwayrqqug',
    'https://assets.chucknorris.host/img/avatar/chuck-norris.png',
    'https://api.chucknorris.io/jokes/lxygnv_ctv-39bwayrqqug',
    "Chuck Norris doesn't pair program.",
  );
  static const searchFact = Fact(
    'y7_p2-52sc2t7ho1hjtwcq',
    'https://assets.chucknorris.host/img/avatar/chuck-norris.png',
    'https://api.chucknorris.io/jokes/y7_p2-52sc2t7ho1hjtwcq',
    'Chuck Norris can write multi-threaded applications with a single thread.',
  );
  static const categoryFact = Fact(
    'tanwfuavq82zn1y6t645bw',
    'https://assets.chucknorris.host/img/avatar/chuck-norris.png',
    'https://api.chucknorris.io/jokes/y7_p2-52sc2t7ho1hjtwcq',
    'Chuck Norris can access private methods.',
  );

  @override
  Future<Fact> getRandom({String? category}) =>
      category != null ? Future.value(categoryFact) : Future.value(randomFact);

  @override
  Future<Fact> getByQuery(String query) => Future.value(searchFact);
}
