import 'package:chuck_norris_facts/src/categories/categories_grid_view.dart';
import 'package:chuck_norris_facts/src/categories/categories_provider.dart';
import 'package:chuck_norris_facts/src/fact/fact_request.dart';
import 'package:chuck_norris_facts/src/fact/fact_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FactSelection extends ConsumerWidget {
  static const routeName = '/facts';

  const FactSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
          child: Column(
            children: [
              const Text('CHUCK NORRIS'),
              TextField(
                onSubmitted: (value) {
                  ref.read(factRequestProvider.notifier).setQuery(value);
                  Navigator.of(context).pushNamed(FactView.routeName);
                },
              ),
              const SizedBox(height: 24),
              const Text('Or choose a category'),
              const SizedBox(height: 24),
              ref.watch(categoriesProvider).when(
                data: (categories) {
                  return Expanded(
                    child: CategoriesGridView(
                      categories: categories,
                    ),
                  );
                },
                error: (e, stackTrace) {
                  return Text(e.toString());
                },
                loading: () {
                  return const CircularProgressIndicator.adaptive();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
