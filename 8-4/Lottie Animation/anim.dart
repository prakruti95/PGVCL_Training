import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyAnim extends StatefulWidget
{
  const MyAnim({super.key});

  @override
  State<MyAnim> createState() => _MyAnimState();
}

class _MyAnimState extends State<MyAnim>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
        body:Center
          (
            child: Lottie.asset('assets/abc.json'),
          )
      );
  }
}
