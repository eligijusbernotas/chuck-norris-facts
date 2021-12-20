import 'package:chuck_norris_facts/src/fact/query/result/fact_query_result_view.dart';
import 'package:chuck_norris_facts/src/fact/query/fact_query.dart';
import 'package:flutter/material.dart';
import 'package:chuck_norris_facts/src/utils/extensions/string.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesGridView extends ConsumerWidget {
  const CategoriesGridView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<String> categories;

  void _onCategoryPressed(BuildContext context, WidgetRef ref, String category) {
    ref.read(factQueryProvider.notifier).setCategory(category);
    FocusScope.of(context).unfocus();
    Navigator.of(context).pushNamed(FactQueryResultView.routeName);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      semanticChildCount: categories.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 3,
      ),
      children: [
        for (final category in categories)
          ElevatedButton(
            onPressed: () => _onCategoryPressed(context, ref, category),
            child: Text(category.capitalize()),
          ),
      ],
    );
  }
}
