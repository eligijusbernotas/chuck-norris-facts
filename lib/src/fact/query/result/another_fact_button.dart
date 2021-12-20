import 'package:chuck_norris_facts/src/fact/fact_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AnotherFactButton extends ConsumerWidget {
  const AnotherFactButton({Key? key}) : super(key: key);

  void _fetchAnother(WidgetRef ref) => ref.refresh(factProvider);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final factAsyncValue = ref.watch(factProvider);
    final buttonLabel = Text(AppLocalizations.of(context)!.anotherFact);
    // ignore: prefer_function_declarations_over_variables
    final onPressed = () => _fetchAnother(ref);

    return OutlinedButton(
      onPressed: factAsyncValue.whenOrNull(
        data: (_) => onPressed,
        error: (_, __) => onPressed,
      ),
      child: factAsyncValue.maybeWhen(
        data: (_) => buttonLabel,
        error: (_, __) => buttonLabel,
        orElse: () => const SizedBox(
          height: 16,
          width: 16,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
