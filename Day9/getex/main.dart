import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getex1/second_screen.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';
import 'home_screen.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX + Provider',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: '/second', page: () => SecondScreen()),
      ],
    );
  }
}
