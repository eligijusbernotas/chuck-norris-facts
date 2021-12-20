import 'package:chuck_norris_facts/src/colors.dart';
import 'package:chuck_norris_facts/src/common/error_view.dart';
import 'package:chuck_norris_facts/src/fact/categories/categories_grid_view.dart';
import 'package:chuck_norris_facts/src/fact/categories/categories_provider.dart';
import 'package:chuck_norris_facts/src/fact/query/fact_query.dart';
import 'package:chuck_norris_facts/src/fact/query/result/fact_query_result_view.dart';
import 'package:chuck_norris_facts/src/fact/query/search_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FactQueryView extends ConsumerWidget {
  static const routeName = '/facts';

  const FactQueryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.titleText,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: -.24,
                  ),
                ),
                const SizedBox(height: 24),
                SearchTextField(
                  placeholder: AppLocalizations.of(context)!.searchPlaceholder,
                  onSubmitted: (value) {
                    ref.read(factQueryProvider.notifier).setQuery(value);
                    FocusScope.of(context).unfocus();
                    Navigator.of(context).pushNamed(FactQueryResultView.routeName);
                  },
                ),
                const SizedBox(height: 24),
                Text(
                  AppLocalizations.of(context)!.categorySelectText,
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 150),
                    child: ref.watch(categoriesProvider).when(
                          data: (categories) => CategoriesGridView(
                            categories: categories,
                          ),
                          error: (e, stackTrace) => ErrorView(
                            exception: e,
                            retry: () => ref.refresh(categoriesProvider),
                          ),
                          loading: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
