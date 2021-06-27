import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:universe/widget/output/output_table_widget.dart';
import 'package:http/http.dart' as http;
import 'package:universe/model/output/output_filter_model.dart';
import 'package:universe/page/output/output_select_provider.dart';
import 'package:provider/provider.dart';

class OutputPage extends StatefulWidget {
  @override
  _OutputPageState createState() => _OutputPageState();
}

class _OutputPageState extends State<OutputPage> {

  ///生成全局唯一标识
  GlobalKey<GenerateOutputTableState> tableKey = GlobalKey();

  final provider = OutputSelectProvider();

  List<OutputFilterModel> _filterTitleList = [];

  fetchData() async {
    var data = await http.get(Uri.parse(
        'https://api.json-generator.com/templates/PYu6joENGYG1/data'),
        headers:<String, String>{'authorization': 'Bearer ' + '29v1p78kr1k0djvb76wncuzf2lzq1fgkb9gkzr4x'});
    if (data.statusCode == 200) {
      List top = json.decode(data.body);
      setState(() {
        _filterTitleList =
            top.map((json) => OutputFilterModel.fromJson(json)).toList();
        OutputFilterModel filterTitleModel = _filterTitleList.first;

        provider.increment(filterTitleModel.modelTitle);
      });
    } else {
      print("err code $data.statusCode");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData().whenComplete(() {
      setState(() {
        provider.refreshChild(GenerateOutputTable(modelNumber: provider.filter));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => provider,
      child: _buildPage(),
    );
  }

  Widget _buildPage() {
    return Scaffold(
      backgroundColor: Color(0xffe4e5e9),
      appBar: AppBar(
        title: Text("分段产能"),
        centerTitle: true,
        backgroundColor: Color(0xff3875F6),
        actions: [
          Container(
            // width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.all(10.0),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Colors.blueAccent,
                value: provider.filter,
                enableFeedback: true,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.white,
                ),
                items: _filterTitleList
                    .map((item) => DropdownMenuItem<String>(
                  child: Row(
                    children: [
                      const SizedBox(width: 0),
                      Text(
                        item.modelTitle,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  value: item.modelTitle,
                ))
                    .toList(),
                onChanged: (value) => setState(() {
                  // this.filterTitle = value!;
                  provider.increment(value!);
                  // provider.refreshChild(GenerateOutputTable(modelNumber: provider.filter));
                  tableKey.currentState!.refreshTableData();
                }),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
        child: PageView(
          children: [
            GenerateOutputTable(key: tableKey,modelNumber: provider.filter),
          ],
        ),
      ),
    );
  }
}

