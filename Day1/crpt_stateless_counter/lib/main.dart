import 'package:crpt_stateless_counter/stateless_counter.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp2());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless Widget Example',
      home: StatelessExample(),
    );
  }
}

class StatelessExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar
      (
        title: Text('Stateless Widget'),
      ),
      body: Center(
        child: Text(
          'This is a Stateless Widget!',
          style: TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ),
    );
  }
}
