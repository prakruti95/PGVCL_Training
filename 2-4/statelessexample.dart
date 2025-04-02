import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget
{

  int counter = 0;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      appBar: AppBar(backgroundColor:Colors.blueGrey,title: Text("Welcome to tops"),),
      body: Center
        (
        child: Column
          (
          mainAxisAlignment: MainAxisAlignment.center,
          children:
          [
            Text("You have clicked Button $counter times",style: TextStyle(fontSize: 50.00),),
            ElevatedButton(
              onPressed: ()
              {
                counter++;

              }, child: Text("Click Me"),)

          ],
        ),
      ),
    );
  }

}

