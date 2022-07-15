import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/custumer/custumer.dart';
import 'package:flutter_application_1/drawer/body/desktop_body.dart';
import 'package:flutter_application_1/item/product/product.dart';
import 'package:flutter_application_1/pages/notice/noticepage.dart';
import 'package:flutter_application_1/pages/report/itemreport.dart';
import 'package:flutter_application_1/pages/report/userReportpage.dart';
//import 'package:flutter_application_1/drawer/desktop_body.dart';

import "package:hidden_drawer_menu/hidden_drawer_menu.dart";

class hdrawer extends StatefulWidget {
  // const hdrawer({Key? key}) : super(key: key);

  @override
  State<hdrawer> createState() => _hdrawerState();
}

class _hdrawerState extends State<hdrawer> {
  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  final user = FirebaseAuth.instance.currentUser!;
  List<ScreenHiddenDrawer> _pages = [];
  final myTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.white,
  );
  @override
  void initState() {
    super.initState();
    _pages = [
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            name: 'E_SEMACHOCH ADMIN PAGE',
            baseStyle: (myTextStyle),
            selectedStyle: (myTextStyle),
            colorLineSelected: Colors.white,
          ),
          MyDesktopBody()),
      // DropdownButton(items: [],),

      ScreenHiddenDrawer(
          ItemHiddenMenu(
            baseStyle: myTextStyle,
            selectedStyle: TextStyle(),
            name: 'ADD CUSTUMER ',
            colorLineSelected: Colors.white,
          ),
          Custumer()),
      ScreenHiddenDrawer(
          ItemHiddenMenu(
            baseStyle: myTextStyle,
            selectedStyle: TextStyle(),
            colorLineSelected: Colors.blueGrey,
            name: 'ADD ITEM ',
          ),
          Item()),
      ScreenHiddenDrawer(
        ItemHiddenMenu(
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
          name: 'NOTICE ',
          colorLineSelected: Colors.blueGrey,
        ),
        noticepage(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
          name: 'user report ',
          colorLineSelected: Colors.blueGrey,
        ),
        userreportpage(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
          baseStyle: myTextStyle,
          selectedStyle: TextStyle(),
          name: 'item report ',
          colorLineSelected: Colors.blueGrey,
        ),
        itempage(),
      ),

      //    ExpansionTile(
      //   title: Text('Heading'),
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //       child: Align(
      //         alignment: Alignment.topLeft,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.start,
      //           mainAxisSize: MainAxisSize.min,
      //           children: <Widget>[
      //             Text('subHeading1'),
      //             Text('subHeading2')
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

      // ScreenHiddenDrawer(
      //   ItemHiddenMenu(
      //     baseStyle: myTextStyle,
      //     selectedStyle: TextStyle(),
      //     name: 'ABOUT US ',
      //     colorLineSelected: Colors.blueGrey,
      //   ),
      //   aboutus(),
      // ),leading:Icon(Icons.add,color:Colors.white,)
    ];
    ExpansionTile(
      title: Text('Heading'),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[Text('subHeading1'), Text('subHeading2')],
            ),
          ),
        ),
      ],
    );
    // reportpage(),
  }

  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      screens: _pages,
      backgroundColorAppBar: Color.fromARGB(246, 27, 44, 102),
      backgroundColorMenu: Color.fromRGBO(21, 30, 61, 1),
      actionsAppBar: [
        Text(user.email!),
        IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout))
      ],
      initPositionSelected: 0,
      slidePercent: 15.0,
      contentCornerRadius: 25,
    );
  }
}
