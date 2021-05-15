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
        Uri.parse('https://next.json-generator.com/api/json/get/41QMzRdOc'));
    var jsonData = json.decode(data.body);

    List<User> users = [];

    for (var i in jsonData) {
      User user = User(i['name'], i['gender'], i['age'], i['email'],
          i['eyeColor'], i['phone'], i['company']);
      users.add(user);
      print(user.eyeColor);
    }
    print(users.length);
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
                  child:
                  DataTable(

                    columns: [
                      DataColumn(label: Text("时间")),
                      DataColumn(label: Text("8:45")),
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
                          DataCell(Text('昨日产量')),
                          DataCell(Text(val.gender)),
                          DataCell(Text(val.age.toString())),
                          DataCell(Text(val.email)),
                          DataCell(Text(val.eyeColor)),
                          DataCell(Text(val.phone)),
                          DataCell(Text(val.company)),
                          DataCell(Text(val.age.toString())),
                          DataCell(Text(val.age.toString())),
                          DataCell(Text(val.age.toString())),
                          DataCell(Text(val.age.toString())),
                          DataCell(Text(val.age.toString())),
                          DataCell(Text(val.age.toString())),

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
  final String name;
  final String gender;
  final int age;
  final String email;
  final String eyeColor;
  final String phone;
  final String company;

  User(this.name, this.gender, this.age, this.email, this.eyeColor, this.phone,
      this.company);
}
