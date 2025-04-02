import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



class MyApp9 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SMS Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SmsScreen(),
    );
  }
}

class SmsScreen extends StatelessWidget {
  // Function to send an SMS
  void _sendSMS(String phoneNumber, String message) async {
    final Uri smsUri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: {'body': message},
    );

    if (await canLaunch(smsUri.toString())) {
      await launch(smsUri.toString());
    } else {
      throw 'Could not send SMS to $phoneNumber';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send SMS'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _sendSMS('1234567890', 'Hello! This is a test message.'),
          child: Text('Send SMS'),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            textStyle: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
