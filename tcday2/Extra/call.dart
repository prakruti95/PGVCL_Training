import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class MyApp8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Call Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CallScreen(),
    );
  }
}

class CallScreen extends StatelessWidget {
  // Function to make a phone call
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(launchUri.toString())) {
      await launch(launchUri.toString());
    } else {
      throw 'Could not call $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make a Call'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _makePhoneCall('1234567890'), // Replace with the desired number
          child: Text('Call Now'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            textStyle: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
