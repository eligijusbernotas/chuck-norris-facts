import 'package:chuck_norris_facts/src/fact/fact_request.dart';
import 'package:chuck_norris_facts/src/fact/fact_view.dart';
import 'package:flutter/material.dart';
import 'package:chuck_norris_facts/src/utils/extensions/string.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesGridView extends ConsumerWidget {
  const CategoriesGridView({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<String> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 8),
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
            onPressed: () {
              ref.read(factRequestProvider.notifier).setCategory(category);
              Navigator.of(context).pushNamed(FactView.routeName);
            },
            child: Text(category.capitalize()),
          ),
      ],
    );
  }
}
