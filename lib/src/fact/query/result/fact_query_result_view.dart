import 'package:chuck_norris_facts/src/fact/query/fact_request_header.dart';
import 'package:chuck_norris_facts/src/fact/query/result/another_fact_button.dart';
import 'package:chuck_norris_facts/src/fact/query/result/fact_view.dart';
import 'package:flutter/material.dart';

class FactQueryResultView extends StatelessWidget {
  static const routeName = '/facts/query/result';

  const FactQueryResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: const [
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: FactRequestHeader(),
            ),
            SizedBox(height: 40),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: FactView(),
              ),
            ),
            Spacer(),
            AnotherFactButton(),
            SizedBox(height: 44),
          ],
        ),
      ),
    );
  }
}
