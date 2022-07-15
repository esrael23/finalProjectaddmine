import 'package:flutter/material.dart';

class navbar extends StatelessWidget {
  //const navbar({Key? key}) : super(key: key);

  int _selectedIndex = 0;
  void _navigateBottomBar(int index) {
    setState:
    (() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _page = [
    // HomePage(),
    // usrname(),
    // report(),
    // signup(),
    Center(
      child: Text(
        'hello',
        style: TextStyle(fontSize: 50),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'notification'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'booking'),
            BottomNavigationBarItem(icon: Icon(Icons.cabin), label: 'cart'),
          ]),
    );
  }
}
