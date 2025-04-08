import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'nextpage.dart';

class MyAnim extends StatefulWidget
{
  const MyAnim({super.key});

  @override
  State<MyAnim> createState() => _MyAnimState();
}

class _MyAnimState extends State<MyAnim>
{
  @override
  void initState()
  {
    checkconnection();


  }

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

  void checkconnection()async
  {
      var connectivityresult = await Connectivity().checkConnectivity();

      if(connectivityresult == ConnectivityResult.mobile)
      {
        Timer(Duration(seconds: 3),
                ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextPage())));
      }
      else if(connectivityresult == ConnectivityResult.wifi)
      {
        Timer(Duration(seconds: 3), ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NextPage())));
      }
      else
      {
        networkerrordialog();
      }

  }

    networkerrordialog()async
   {
      return showDialog
        (
          context: context,
          builder:(BuildContext context)
          {
              return AlertDialog
                (
                    icon: Icon(Icons.error),
                    backgroundColor: Colors.blueGrey,
                    title: Text("\n Network Error"),
                    actions:
                    [
                        ElevatedButton(onPressed: ()
                        {

                          //Navigator.pop(context);
                          exit(0);
                        }, child: Text("OK"))
                    ],
                );
          }
        );
   }
}
