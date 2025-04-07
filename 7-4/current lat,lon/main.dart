import 'package:flutter/material.dart';
import 'package:trainingday5/weather1.dart';

import 'homepage2.dart';
import 'homepage3.dart';
import 'homepage4.dart';
import 'locationex.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
        home:LocationEx()
      );
  }
}

