import 'package:chopper/chopper.dart';
import 'package:chuck_norris_facts/src/fact/fact_info_view.dart';
import 'package:chuck_norris_facts/src/fact/fact_request.dart';
import 'package:chuck_norris_facts/src/fact/facts_service.dart';
import 'package:chuck_norris_facts/src/fact/fact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chuck_norris_facts/src/utils/extensions/string.dart';
import 'package:chuck_norris_facts/src/utils/builders.dart' as builders;

final factProvider = FutureProvider.autoDispose<Fact>((ref) async {
  final service = ref.watch(factsServiceProvider);
  final request = ref.watch(factRequestProvider);
  late final Response<Fact> response;

  if (request.isPlainRandom) {
    response = await service.getRandom();
  } else if (request.isCategorySet) {
    response = await service.getRandom(category: request.category!);
  } else if (request.isQuerySet) {
    response = await service.getByQuery(request.query!);
  }

  if (response.isSuccessful) {
    return response.body!;
  }

  throw Exception();
});

class FactView extends ConsumerStatefulWidget {
  static const routeName = '/facts/fact';

  const FactView({Key? key}) : super(key: key);

  @override
  _FactViewState createState() => _FactViewState();
}

class _FactViewState extends ConsumerState<FactView> {
  Fact? currentFact;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final factAsyncValue = ref.watch(factProvider);
    final factRequest = ref.watch(factRequestProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(
                      'Random joke: ${factRequest.category?.capitalize() ?? factRequest.query}',
                      textAlign: TextAlign.center,
                      style: textTheme.headline6,
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 150),
                layoutBuilder: builders.topCenterAlignedLayoutBuilder,
                child: factAsyncValue.when(
                  data: (fact) {
                    currentFact = fact;

                    return FactInfoView(
                      fact: fact,
                      key: Key(fact.id),
                    );
                  },
                  loading: () {
                    if (currentFact != null) {
                      return FactInfoView(
                        fact: currentFact!,
                        key: Key(currentFact!.id),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                  error: (_, __) {
                    if (currentFact != null) {
                      return FactInfoView(
                        fact: currentFact!,
                        key: Key(currentFact!.id),
                      );
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ),
            const Spacer(),
            OutlinedButton(
              onPressed: () => ref.refresh(factProvider),
              child: const Text('Another Random Joke'),
            ),
            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}
