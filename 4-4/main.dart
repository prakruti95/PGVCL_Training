import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'alertdialog.dart';

void main()
{
  runApp(BackButton1());
}
class MyApp extends StatelessWidget 
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
      (
        appBar: AppBar(title:Text("Floating Action Button"),),
        body: SingleChildScrollView
          (
            child: Column
              (
                mainAxisAlignment: MainAxisAlignment.center,
                children: 
                [
                  Image.network("https://5.imimg.com/data5/ECOM/Default/2022/9/JK/XU/IL/152820152/1-8486c109-8156-4616-abda-92e69d807842-500x500.png",width: 250,height: 250,),
                  SizedBox(height: 10,),
                  Image.network("https://5.imimg.com/data5/ECOM/Default/2022/9/JK/XU/IL/152820152/1-8486c109-8156-4616-abda-92e69d807842-500x500.png",width: 250,height: 250,),
                  SizedBox(height: 10,),
                  Image.network("https://5.imimg.com/data5/ECOM/Default/2022/9/JK/XU/IL/152820152/1-8486c109-8156-4616-abda-92e69d807842-500x500.png",width: 250,height: 250,),
                  SizedBox(height: 10,),
                  Image.network("https://5.imimg.com/data5/ECOM/Default/2022/9/JK/XU/IL/152820152/1-8486c109-8156-4616-abda-92e69d807842-500x500.png",width: 250,height: 250,),
                  Image.network("https://5.imimg.com/data5/ECOM/Default/2022/9/JK/XU/IL/152820152/1-8486c109-8156-4616-abda-92e69d807842-500x500.png",width: 250,height: 250,),
                  SizedBox(height: 10,),
                  Image.network("https://5.imimg.com/data5/ECOM/Default/2022/9/JK/XU/IL/152820152/1-8486c109-8156-4616-abda-92e69d807842-500x500.png",width: 250,height: 250,),
                  SizedBox(height: 10,),
                  Image.network("https://5.imimg.com/data5/ECOM/Default/2022/9/JK/XU/IL/152820152/1-8486c109-8156-4616-abda-92e69d807842-500x500.png",width: 250,height: 250,),
                  SizedBox(height: 10,),
                  Image.network("https://5.imimg.com/data5/ECOM/Default/2022/9/JK/XU/IL/152820152/1-8486c109-8156-4616-abda-92e69d807842-500x500.png",width: 250,height: 250,)
                ],
              ),
          ),
          // floatingActionButton: Column
          //   (
          //     children: [
          //
          //         FloatingActionButton(onPressed: ()
          //         {
          //             print("1");
          //         }),
          //         FloatingActionButton(onPressed: ()
          //         {
          //           print("2");
          //         }),
          //
          //     ],
          //   ),
        floatingActionButton: FloatingActionButton(onPressed: ()
          {

              Fluttertoast.showToast
                (
                  msg: "Hello Welcome",
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 4,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
                );

          },
          child: Icon(Icons.add),
        ),

      
      );
  }
}

