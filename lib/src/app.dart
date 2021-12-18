import 'package:chuck_norris_facts/src/fact/fact_selection.dart';
import 'package:chuck_norris_facts/src/fact/fact_view.dart';
import 'package:chuck_norris_facts/src/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,
      theme: lightTheme,
      darkTheme: ThemeData.dark(),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case FactView.routeName:
                return const FactView();
              default:
                return const FactSelection();
            }
          },
        );
      },
    );
  }
}
