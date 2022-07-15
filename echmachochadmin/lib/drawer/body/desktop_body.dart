import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer/listviewbox.dart';

class MyDesktopBody extends StatelessWidget {
  final List _posts = [];
  MyDesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          children: [
            // First column
            Expanded(
              child: Column(
                children: [
                  // youtube video
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: AspectRatio(
                      aspectRatio: 60 / 9,
                      child: Container(
                        color: Colors.blue[400],
                      ),
                    ),
                  ),

                  // comment section & recommended videos
                  Expanded(
                    child: ListView.builder(
                      itemCount: _posts.length,
                      itemBuilder: (context, index) {
                        return list_box(
                          child: _posts[index],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),

            // second column
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                width: 200,
                color: Colors.blue[300],
              ),
            )
          ],
        ),
      ),
    );
  }
}
