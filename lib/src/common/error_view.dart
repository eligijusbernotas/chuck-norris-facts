import 'package:chuck_norris_facts/src/colors.dart';
import 'package:chuck_norris_facts/src/utils/excpetion_utils.dart' as exception_utils;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
    required this.exception,
    this.retry,
  }) : super(key: key);

  final Object exception;
  final VoidCallback? retry;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Spacer(),
        const Icon(
          Icons.sentiment_very_dissatisfied_rounded,
          size: 64,
          color: AppColors.primary,
        ),
        const SizedBox(height: 16),
        Text(
          exception_utils.getMessage(exception, AppLocalizations.of(context)!.unknownErrorText),
          style: textTheme.caption,
        ),
        const SizedBox(height: 40),
        if (retry != null)
          TextButton.icon(
            onPressed: retry,
            icon: const Icon(
              Icons.refresh_rounded,
            ),
            label: Text(AppLocalizations.of(context)!.tryAgainText),
          ),
        const Spacer(flex: 2),
      ],
    );
  }
}
