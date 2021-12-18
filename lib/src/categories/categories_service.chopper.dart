// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CategoriesService extends CategoriesService {
  _$CategoriesService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CategoriesService;

  @override
  Future<Response<List<String>>> getCategories() {
    final $url = '/categories';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<List<String>, String>($request);
  }
}
