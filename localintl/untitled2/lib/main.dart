import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart'; // Adjust based on your generated localization files

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = Locale('en', '');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: _locale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English
        const Locale('es', ''), // Spanish
      ],
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
        actions: [
          IconButton(
            icon: Icon(Icons.language),
            onPressed: () {
              Locale newLocale = Localizations.localeOf(context).languageCode == 'en'
                  ? Locale('es', '')
                  : Locale('en', '');
              MyApp.setLocale(context, newLocale);
            },
          ),
        ],
      ),
      body: Center(
        child: Text(S.of(context).greeting),
      ),
    );
  }
}
