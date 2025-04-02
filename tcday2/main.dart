import 'package:flutter/material.dart';
import 'login_page.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login App',
      theme: appTheme, // Apply the custom theme
      home: LoginPage(),
    );
  }
}