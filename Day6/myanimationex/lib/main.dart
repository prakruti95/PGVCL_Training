import 'package:flutter/material.dart';
import 'package:myanimationex/rotate.dart';
import 'package:myanimationex/sequential.dart';
import 'package:myanimationex/slide.dart';
import 'package:myanimationex/together.dart';
import 'package:myanimationex/zoominout.dart';

import 'blink.dart';
import 'bounce.dart';
import 'fadeinout.dart';
import 'move.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TogetherDemo(),
    );
  }
}
