import 'package:chuck_norris_facts/src/fact/query/fact_query_view.dart';
import 'package:chuck_norris_facts/src/fact/query/result/fact_query_result_view.dart';
import 'package:chuck_norris_facts/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      restorationScopeId: 'app',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: FactQueryView.routeName,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case FactQueryResultView.routeName:
                return const FactQueryResultView();
              default:
                return const FactQueryView();
            }
          },
        );
      },
    );
  }
}
