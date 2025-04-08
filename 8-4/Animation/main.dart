import 'package:flutter/material.dart';
import 'package:trainingday6/rotate.dart';
import 'package:trainingday6/sequential.dart';
import 'package:trainingday6/slide.dart';
import 'package:trainingday6/together.dart';
import 'package:trainingday6/zoominout.dart';

import 'blinkscreen.dart';
import 'bounce.dart';
import 'fadeinout.dart';
import 'move.dart';

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
        debugShowCheckedModeBanner: false,
        home:TogetherDemo()
      );
  }
}
