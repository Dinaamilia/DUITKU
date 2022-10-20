import 'dart:html';

import 'package:flutter/material.dart';
import 'package:duitku/db/database.dart';
import 'package:duitku/models/models.dart';
import 'package:duitku/screens/create.dart';
import 'package:duitku/screens/update.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DatabaseInstance? databaseInstance;
  void initState() {
    databaseInstance = DatabaseInstance();
    initDatabase();
    super.initState();
  }

  Future initDatabase() async {
    await databaseInstance!.database();
    setState(() {});
  }

  ShowAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("Yakin"),
      onPressed: () {},
    );

    AlertDialog alertDialog = AlertDialog(
      title: Text("Peringatan!"),
      content: Text("Anda Yakin Akan Menghapus?"),
      actions: [okButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kelola Duitku",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Kelola Duitku"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CreateScreen()));
            },
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text("Total Pemasukan : Rp. 1000"),
          SizedBox(
            height: 20,
          ),
          Text("Total Pengeluaran Rp. 500"),
          FutureBuilder<List<TransaksiModel>>(
              future: DatabaseInstance.getAll(),
              builder: (context, snapshot) {
                print('HASIL : ' + snapshot.data.toString());
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading")
                } else {
                  if (snapshot.hasData) {

                  }
                }
                return ListTile(
                    title: Text("Makan Siang"),
                    subtitle: Text("Rp.200"),
                    leading: Icon(
                      Icons.download,
                      color: Colors.green,
                    ),
                    trailing: Wrap(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UpdateScreen()));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.grey,
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {
                              ShowAlertDialog(context);
                            },
                            icon: Icon(Icons.delete, color: Colors.red))
                      ],
                    ));
                    
              })
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

class ShowAlertDialog {
  ShowAlertDialog(BuildContext context);
}
