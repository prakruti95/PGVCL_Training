import 'dart:io';

import 'package:flutter/material.dart';

class BackButton1 extends StatelessWidget
{
  const BackButton1({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
      (
        home:MyApp2(),
      );

  }
}
class MyApp2 extends StatefulWidget
{
  const MyApp2({super.key});

  @override
  State<MyApp2> createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2>
{
  DateTime? _lastPressedAt;

  @override
  Widget build(BuildContext context)
  {
    return WillPopScope
      (
        onWillPop:() async
        {
          DateTime now = DateTime.now();
          if (_lastPressedAt == null || now.difference(_lastPressedAt!) > Duration(seconds: 2))
          {

            _lastPressedAt = now;
            _showExitDialog();

            return false;
          }


            return true;
        },

        child: Scaffold
          (
          appBar: AppBar(title: Text("Double Tap to Exit"),),
              body: Center
                (
                  child: Text("Double tap to exit"),
                ),
          ),


      );


    // return Scaffold
    //   (
    //     appBar: AppBar(title: Text("Double Tap to Exit"),),
    //     body: Center
    //       (
    //         child: Text("Double tap to exit"),
    //       ),
    //
    //   );
  }

void _showExitDialog()
  {
       showDialog
        (
          context: context,
          builder: (context) => AlertDialog
            (
                title: Text("Are you sure you want to exit?"),
                content:Text("if you want to exit directly press double tap"),
                actions:
                [
                    TextButton(onPressed: ()
                    {
                        exit(0);

                    }, child:Text("OK")),
                    TextButton(onPressed: ()
                    {

                        Navigator.pop(context);

                    }, child:Text("CANCEL"))

                ],

            )

        );
  }
}

