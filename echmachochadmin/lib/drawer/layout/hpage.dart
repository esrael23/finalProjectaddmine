import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer/body/mobilebody.dart';
import 'package:flutter_application_1/drawer/drawer.dart';
import 'package:flutter_application_1/drawer/layout/layout.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MyMobileBody(),
        desktopBody: hdrawer(),
      ),
    );
  }
}
