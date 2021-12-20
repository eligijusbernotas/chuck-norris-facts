// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_api_repository.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$FactApiRepository extends FactApiRepository {
  _$FactApiRepository([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = FactApiRepository;

  @override
  Future<Fact> getRandom({String? category}) async {
    final $url = '/random';
    final $params = <String, dynamic>{'category': category};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    final response = await client.send<Fact, Fact>($request);

    if (response.isSuccessful) {
      return response.body!;
    } else {
      throw response.error!;
    }
  }

  @override
  Future<Fact> getByQuery(String query) async {
    final $url = '/random';
    final $params = <String, dynamic>{'query': query};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    final response = await client.send<Fact, Fact>($request);

    if (response.isSuccessful) {
      return response.body!;
    } else {
      throw response.error!;
    }
  }
}
