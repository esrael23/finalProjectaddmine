import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class usrname extends StatelessWidget {
  final String documentId;
  usrname({required this.documentId});
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('custumeers');
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text('${data['name']}' + ' ' + '${data['homenumber']}');
        }
        return Text('loading.....');
      }),
    );
  }
}
