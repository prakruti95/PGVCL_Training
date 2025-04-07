import 'package:flutter/material.dart';



class BlinkDemo extends StatefulWidget {
  @override
  _BlinkDemoState createState() => _BlinkDemoState();
}

class _BlinkDemoState extends State<BlinkDemo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Time for one blink cycle
    )..repeat(reverse: true); // Repeats the animation back and forth

    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Text(
            'Blinking Text!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
