import 'package:chopper/chopper.dart';
import 'package:chuck_norris_facts/src/fact/fact_request.dart';
import 'package:chuck_norris_facts/src/fact/facts_service.dart';
import 'package:chuck_norris_facts/src/fact/fact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chuck_norris_facts/src/utils/extensions/string.dart';

final factProvider = FutureProvider.autoDispose<Fact>((ref) async {
  final service = ref.watch(factsServiceProvider);
  final request = ref.watch(factRequestProvider);
  late final Response<Fact> response;

  if (request.isPlainRandom) {
    response = await service.getRandom();
  } else if (request.isCategorySet) {
    response = await service.getRandom(category: request.category);
  } else {
    response = await service.getByQuery(request.query!);
  }

  if (response.isSuccessful) {
    return response.body!;
  }

  throw Exception();
});

class FactView extends ConsumerWidget {
  static const routeName = '/facts/fact';

  const FactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: ref.watch(factProvider).when(
              data: (data) {
                return Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(Icons.close),
                        ),
                        Text(
                          'Random joke: ${ref.read(factRequestProvider).category?.capitalize() ?? ref.read(factRequestProvider).query}',
                        ),
                      ],
                    ),
                    Image.network(data.iconUrl),
                    Text(data.value),
                    OutlinedButton(
                      onPressed: () => ref.read(factRequestProvider.notifier).repeat(),
                      child: const Text('Another Random Joke'),
                    ),
                  ],
                );
              },
              loading: () => const CircularProgressIndicator.adaptive(),
              error: (error, stackTrace) => Text(error.toString()),
            ),
      ),
    );
  }
}
