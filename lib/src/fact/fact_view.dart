import 'package:chuck_norris_facts/src/fact/fact.dart';
import 'package:chuck_norris_facts/src/fact/fact_info_view.dart';
import 'package:chuck_norris_facts/src/fact/fact_request.dart';
import 'package:chuck_norris_facts/src/fact/repositories/fact_api_repository.dart';
import 'package:chuck_norris_facts/src/utils/builders.dart' as builders;
import 'package:chuck_norris_facts/src/utils/extensions/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final factProvider = FutureProvider.autoDispose<Fact>((ref) async {
  final repository = ref.watch(factRespositoryProvider);
  final request = ref.watch(factRequestProvider);

  if (request.isPlainRandom) {
    return await repository.getRandom();
  } else if (request.isCategorySet) {
    return await repository.getRandom(category: request.category!);
  }

  return await repository.getByQuery(request.query!);
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
                      '${AppLocalizations.of(context)!.randomFact}${factRequest.category?.capitalize() ?? factRequest.query}',
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
                  error: (e, __) {
                    if (currentFact != null) {
                      final errorSnackbar = SnackBar(content: Text(e.toString()));

                      ScaffoldMessenger.of(context).showSnackBar(errorSnackbar);

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
              onPressed: factAsyncValue.whenOrNull(
                data: (_) => () => ref.refresh(factProvider),
                error: (_, __) => () => ref.refresh(factProvider),
              ),
              child: factAsyncValue.maybeWhen(
                orElse: () => const SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
                data: (_) => Text(AppLocalizations.of(context)!.anotherFact),
              ),
            ),
            const SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}
