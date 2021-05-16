import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GenerateOutputTable extends StatefulWidget {
  // const GenerateOutputTable({Key key}) : super(key: key);

  // static const routeName = '/table';

  @override
  _GenerateOutputTableState createState() => _GenerateOutputTableState();
}

class _GenerateOutputTableState extends State<GenerateOutputTable> {
  List<User> _userList = [];

  fetchUsers() async {
    var data = await http.get(
        Uri.parse('https://next.json-generator.com/api/json/get/EJU8um9O5'));
    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var i in jsonData) {
      User user = User(
        i['seven'],
        i['eight'],
        i['nine'],
        i['ten'],
        i['eleven'],
        i['twelve'],
        i['thirteen'],
        i['fourteen'],
        i['fifteen'],
        i['sixteen'],
        i['seventeen'],
        i['eighteen'],
        i['nineteen'],
      );
      users.add(user);
    }
    this.setState(() {
      _userList = users;
    });
  }

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  )
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(label: Text("时间")),
                      DataColumn(label: Text("8:45-9:45")),
                      DataColumn(label: Text("9:45")),
                      DataColumn(label: Text("10：45")),
                      DataColumn(label: Text("11：45")),
                      DataColumn(label: Text("13：45")),
                      DataColumn(label: Text("14：45")),
                      DataColumn(label: Text("15：45")),
                      DataColumn(label: Text("16：45")),
                      DataColumn(label: Text("17：45")),
                      DataColumn(label: Text("18：45")),
                      DataColumn(label: Text("19：45")),
                      DataColumn(label: Text("20：45")),
                    ],
                    rows: _userList
                        .map(
                          ((val) => DataRow(
                                cells: <DataCell>[
                                  DataCell(
                                      Text(val.seven,
                                      style: TextStyle(fontWeight: FontWeight.bold))),
                                  DataCell(Text(val.eight.toString())),
                                  DataCell(Text(val.nine.toString())),
                                  DataCell(Text(val.ten.toString())),
                                  DataCell(Text(val.eleven.toString())),
                                  DataCell(Text(val.twelve.toString())),
                                  DataCell(Text(val.thirteen.toString())),
                                  DataCell(Text(val.fourteen.toString())),
                                  DataCell(Text(val.fifteen.toString())),
                                  DataCell(Text(val.sixteen.toString())),
                                  DataCell(Text(val.seventeen.toString())),
                                  DataCell(Text(val.eighteen.toString())),
                                  DataCell(Text(val.nineteen.toString())),
                                ],
                              )),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  final String seven;
  final int eight;
  final int nine;
  final int ten;
  final int eleven;
  final int twelve;
  final int thirteen;
  final int fourteen;
  final int fifteen;
  final int sixteen;
  final int seventeen;
  final int eighteen;
  final int nineteen;

  User(
    this.seven,
    this.eight,
    this.nine,
    this.ten,
    this.eleven,
    this.twelve,
    this.thirteen,
    this.fourteen,
    this.fifteen,
    this.sixteen,
    this.seventeen,
    this.eighteen,
    this.nineteen,
  );
}
