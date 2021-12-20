import 'package:chuck_norris_facts/src/common/error_view.dart';
import 'package:chuck_norris_facts/src/fact/fact.dart';
import 'package:chuck_norris_facts/src/fact/fact_provider.dart';
import 'package:chuck_norris_facts/src/fact/query/result/fact_info_view.dart';
import 'package:chuck_norris_facts/src/utils/builders.dart' as builders;
import 'package:chuck_norris_facts/src/utils/excpetion_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FactView extends ConsumerStatefulWidget {
  const FactView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FactViewState();
}

class _FactViewState extends ConsumerState<FactView> {
  Fact? currentFact;

  void _showErrorSnack(Object e) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final errorSnackbar = SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        getMessage(e, AppLocalizations.of(context)!.unknownErrorText),
      ),
    );

    scaffoldMessenger.hideCurrentSnackBar(reason: SnackBarClosedReason.remove);
    scaffoldMessenger.showSnackBar(errorSnackbar);
  }

  @override
  Widget build(BuildContext context) {
    final factAsyncValue = ref.watch(factProvider);

    return AnimatedSwitcher(
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
            _showErrorSnack(e);

            return FactInfoView(
              fact: currentFact!,
              key: Key(currentFact!.id),
            );
          }

          return ErrorView(
            exception: e,
          );
        },
      ),
    );
  }
}
