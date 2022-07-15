import 'dart:html';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class custumer_list extends StatefulWidget {
  final Stream<QuerySnapshot> users =
      FirebaseFirestore.instance.collection('users').snapshots();
  @override
  State<custumer_list> createState() => _custumer_listState();
}

class _custumer_listState extends State<custumer_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('read data from cloun firesetore '),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Text(
              'read data from cloun firesetore ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Column(
              children: [
                Container(
                  height: 250,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: StreamBuilder<QuerySnapshot>(
                      stream: widget.users,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('something went wrong.');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text('loading');
                        }
                        final data = snapshot.requireData;

                        return ListView.builder(
                          itemCount: data.size,
                          itemBuilder: ((context, index) {
                            return Text(
                                ' name  ${data.docs[index]['name']} name  ${data.docs[index]['name']} name  ${data.docs[index]['name']}  email ${data.docs[index]['age']}');
                          }),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
