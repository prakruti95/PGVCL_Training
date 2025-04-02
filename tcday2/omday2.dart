import 'package:flutter/material.dart';


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Light and Dark Theme',
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: ThemeSwitcherScreen(
        isDarkMode: _isDarkMode,
        toggleTheme: _toggleTheme,
      ),
    );
  }
}

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.blue,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black, fontSize: 18),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.deepPurple,
      foregroundColor: Colors.white,
    ),
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}

class ThemeSwitcherScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  ThemeSwitcherScreen({required this.isDarkMode, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Light and Dark Theme'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.webp'),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 10),
            Text(
              'Flutter Developer',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: toggleTheme,
              child: Text(isDarkMode ? 'Switch to Light Theme' : 'Switch to Dark Theme'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
