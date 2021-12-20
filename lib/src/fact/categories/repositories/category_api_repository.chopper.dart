// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_api_repository.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CategoryApiRepository extends CategoryApiRepository {
  _$CategoryApiRepository([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CategoryApiRepository;

  @override
  Future<List<String>> getCategories() async {
    final $url = '/categories';
    final $request = Request('GET', $url, client.baseUrl);
    final response = await client.send<List<String>, String>($request);

    if (response.isSuccessful) {
      return response.body!;
    } else {
      throw response.error!;
    }
  }
}
