import 'package:chuck_norris_facts/src/fact/fact.dart';
import 'package:flutter/material.dart';

class FactInfoView extends StatelessWidget {
  const FactInfoView({
    Key? key,
    required this.fact,
  }) : super(key: key);

  final Fact fact;

  @override
  Widget build(BuildContext context) {
    final texTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Image.network(fact.iconUrl),
        const SizedBox(height: 24),
        Text(
          '“${fact.value}“',
          textAlign: TextAlign.center,
          style: texTheme.bodyText1,
        ),
      ],
    );
  }
}
