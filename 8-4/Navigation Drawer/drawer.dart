import 'package:flutter/material.dart';
import 'package:navigationdrawerex/settings.dart';

import 'about.dart';
import 'home.dart';

class DrawerEx extends StatefulWidget
{
  String a = "tops";

  @override
  State<DrawerEx> createState() => _DrawerExState();
}

class _DrawerExState extends State<DrawerEx>
{
  int selectedindex = 0;

  List optionstitle =
  [
      "Home Page",
      "About Page",
      "Settings",
  ];


  List optionsscreen =
  [
    HomeScreen(),
    AboutScreen(),
    SettingsScreen()
  ];

   _onSelectDrawerItem(int index)
  {
    setState(() {
      selectedindex = index;
    });
    Navigator.pop(context); // Close the drawer
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (

        appBar: AppBar(title: Text("Drawer Example"),backgroundColor: Colors.blueGrey,),
        body: optionsscreen[selectedindex],
        drawer: Drawer
        (
          child: ListView
            (
                padding: EdgeInsets.zero,
                children:
                [
                     UserAccountsDrawerHeader
                       (
                         accountName: Text("Tops Tech"),
                         accountEmail: Text("tops@gmail.com"),
                         currentAccountPicture:CircleAvatar
                           (
                            backgroundColor: Colors.orange,
                           child: Text(

                             widget.a[0].toUpperCase(),
                             style: TextStyle(fontSize: 40.0, color: Colors.white),
                           ),
                           ),
                       ),
                        for(int i=0;i<optionstitle.length;i++)
                        ListTile
                          (
                            leading: Icon(Icons.circle),
                            title: Text(optionstitle[i]),
                            selectedTileColor: Colors.purple.shade100,
                            selected: selectedindex==i,
                            onTap:() => _onSelectDrawerItem(i),
                          )


                ],
            ),
        ),

      );
  }
}
