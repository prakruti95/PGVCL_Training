import 'package:flutter/material.dart';



class MyApp2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless Counter App',
      home: StatelessCounter(),
    );
  }
}

class StatelessCounter extends StatelessWidget {
  final int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless Counter App'),
      ),
      body: Center(
        child: Text(
          'Counter: $counter',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Counter won't change because Stateless Widgets don't maintain state
          print('This button does nothing as this is a Stateless Widget!');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
