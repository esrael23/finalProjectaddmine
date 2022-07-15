import 'package:flutter/material.dart';
import 'package:flutter_application_1/drawer/drawer.dart';

class MyMobileBody extends StatelessWidget {
  const MyMobileBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          children: [
            // youtube video
            // Padding(
            //   padding: const EdgeInsets.all(2.0),
            //   child: AspectRatio(
            //     aspectRatio: 60 / 9,
            //     child: Container(
            //       color: Color.fromARGB(255, 2, 25, 44),
            //     ),
            //   ),
            // ),

            // // comment section & recommended videos
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: 8,
            //     itemBuilder: (context, index) {
            //       return Padding(
            //         padding: const EdgeInsets.all(2.0),
            //         child: Container(
            //           color: Color.fromARGB(255, 23, 54, 80),
            //           height: 120,
            //         ),
            //       );
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: AspectRatio(
                aspectRatio: 60 / 9,
                child: hdrawer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
