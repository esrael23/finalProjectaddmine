//

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class itempage extends StatefulWidget {
  @override
  _DataTableExample createState() => _DataTableExample();
}

class _DataTableExample extends State<itempage> {
  List _itemList = []; // global variable to store items from database

  Future<void> getData() async {
    List dataList = []; // local variable to store items from database
    try {
      await FirebaseFirestore.instance
          .collection('item')
          .get()
          .then((QuerySnapshot querySnapshot) => {
                querySnapshot.docs.forEach((doc) {
                  dataList.add(doc.data());
                }),
              });
      setState(() => _itemList = dataList); // set local variable to global list
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    getData(); // call the function to get the items data

    return MaterialApp(
      home: Scaffold(
          // appBar: AppBar(
          //   title: Text('Flutter DataTable Example'),
          // ),
          body: ListView(children: <Widget>[
        Center(
            child: Text(
          'People-Chart',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )),
        DataTable(
          columns: [
            DataColumn(
                label: Text('ID',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Name',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Price',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            DataColumn(
                label: Text('Quantity',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          ],
          rows: [
            for (var item in _itemList)
              DataRow(cells: [
                DataCell(Text((_itemList.indexOf(item) + 1).toString())),
                DataCell(Text(item["name"])),
                DataCell(Text(item["price"])),
                DataCell(Text(item["quantity"])),
              ]),
          ],
        ),
      ])),
    );
  }
}
