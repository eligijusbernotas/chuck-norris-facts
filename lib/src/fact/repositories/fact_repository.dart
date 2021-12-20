import 'package:chuck_norris_facts/src/fact/fact.dart';

abstract class FactRepository {
  Future<Fact> getRandom({String? category});

  Future<Fact> getByQuery(String query);
}
