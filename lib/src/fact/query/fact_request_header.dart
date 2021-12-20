import 'package:chuck_norris_facts/src/fact/query/fact_query.dart';
import 'package:chuck_norris_facts/src/utils/extensions/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FactRequestHeader extends ConsumerWidget {
  const FactRequestHeader({Key? key}) : super(key: key);

  String _getRequestMethod(FactQuery request) => (request.category?.capitalize() ?? request.searchQuery) ?? 'Random';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final factRequest = ref.watch(factQueryProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: CloseButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        Expanded(
          flex: 10,
          child: Text(
            '${AppLocalizations.of(context)!.randomFact}${_getRequestMethod(factRequest)}',
            textAlign: TextAlign.center,
            style: textTheme.headline6,
          ),
        ),
        const Spacer(flex: 1),
      ],
    );
  }
}
