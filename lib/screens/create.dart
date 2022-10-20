import 'dart:async';

import 'package:duitku/db/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:duitku/db/database.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  final int _value = 1;

  @override
  Widget build(BuildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create"),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nama"),
          TextField(),
          SizedBox(
            height: 20,
          ),
          Text("Tipe Transaksi"),
          ListTile(
            title: Text("Pemasukan"),
            leading: Radio(groupValue: _value, value: 1, onChanged: (value) {}),
          ),
          ListTile(
            title: Text("Pengeluaran"),
            leading: Radio(groupValue: _value, value: 2, onChanged: (value) {}),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Total"),
          TextField(),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Simpan"))
        ],
      )),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
