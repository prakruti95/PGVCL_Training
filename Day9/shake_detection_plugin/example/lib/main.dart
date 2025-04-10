import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color _backgroundColor = Colors.white;
  static const EventChannel _shakeEventChannel =
  EventChannel('shake_detection_plugin/shake_event');

  @override
  void initState() {
    super.initState();

    // Listen for shake events from the native side
    _shakeEventChannel.receiveBroadcastStream().listen((_) {
      // Change the background color after receiving the second shake event
      setState(() {
        _backgroundColor = _backgroundColor == Colors.red ? Colors.blue : Colors.red;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shake Detection'),
        ),
        body: Container(
          color: _backgroundColor, // Apply the background color here
          child: Center(
            child: Text(
              'Shake the device twice to change color!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
