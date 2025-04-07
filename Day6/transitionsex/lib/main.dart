import 'package:flutter/material.dart';
import 'package:transitionsex/trans2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text('Button & Page Transition')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: TextStyle(fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).push(_createPageTransition());
          },
          child: Text('Go to Next Page'),
        ),
      ),
    );
  }

  // Custom Page Transition
  PageRouteBuilder _createPageTransition() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Slide from right
        const end = Offset(0.0, 0.0);
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(title: Text('Second Page')),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            textStyle: TextStyle(fontSize: 18),
          ),
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous page
          },
          child: Text('Go Back'),
        ),
      ),
    );
  }
}
