import 'package:flutter/material.dart';



class FadeInFadeOutDemo extends StatefulWidget {
  @override
  _FadeInFadeOutDemoState createState() => _FadeInFadeOutDemoState();
}

class _FadeInFadeOutDemoState extends State<FadeInFadeOutDemo> {
  bool _visible = true; // Initial visibility

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _visible ? 1.0 : 0.0, // Fade In/Fade Out effect
            duration: Duration(seconds: 2),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Center(
                child: Text(
                  'Hello Flutter!',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _visible = !_visible; // Toggle visibility
              });
            },
            child: Text(_visible ? 'Fade Out' : 'Fade In'),
          ),
        ],
      ),
    );
  }
}
