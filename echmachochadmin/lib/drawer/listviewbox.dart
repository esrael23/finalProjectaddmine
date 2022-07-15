import 'package:flutter/material.dart';

class list_box extends StatelessWidget {
  final String child;
  list_box({required this.child});
  // list_box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: 100,
        width: 100,
        color: Colors.blue,
        child: Text(child),
      ),
    );
  }
}
