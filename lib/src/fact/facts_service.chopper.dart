// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'facts_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$FactsService extends FactsService {
  _$FactsService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = FactsService;

  @override
  Future<Response<Fact>> getRandom({String? category}) {
    final $url = '/random';
    final $params = <String, dynamic>{'category': category};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Fact, Fact>($request);
  }

  @override
  Future<Response<Fact>> getByQuery(String query) {
    final $url = '/random';
    final $params = <String, dynamic>{'query': query};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<Fact, Fact>($request);
  }
}
