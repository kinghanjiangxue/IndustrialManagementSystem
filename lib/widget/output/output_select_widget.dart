// import 'package:flutter/material.dart';
//
// class FilterSelectTable extends StatefulWidget {
//   @override
//   _FilterSelectTableState createState() => _FilterSelectTableState();
// }
//
// class NewObject {
//   final String title;
//
//   NewObject(this.title);
// }
//
// class _FilterSelectTableState extends State<FilterSelectTable> {
//
//
//   fetchUsers() async {
//     var titleData = await http.get(
//         Uri.parse('http://www.json-generator.com/api/json/get/bUcSgvZPEy?indent=2'));
//     if (titleData.statusCode == 200) {
//
//       Map<String, dynamic>  titles = json.decode(titleData.body);
//       setState(() {
//         homeTitleModel = HomeTitleModel.fromTitleJson(titles);
//       });
//     } else {
//       print("err code $titleData.statusCode");
//     }
//
//     var data = await http.get(
//         Uri.parse('http://www.json-generator.com/api/json/get/bVRhCDbbpK?indent=2'));
//     if (data.statusCode == 200) {
//       List top = json.decode(data.body);
//       setState(() {
//         _dataList = top.map((json) => HomeDataModel.fromJson(json)).toList();
//       });
//     } else {
//       print("err code $data.statusCode");
//     }
//   }
//
//   static final List<NewObject> items = <NewObject>[
//     NewObject('机台1'),
//     NewObject('机台2'),
//     NewObject('机台3'),
//     NewObject('机台4'),
//     NewObject('机台5'),
//     NewObject('机台6'),
//     NewObject('机台7'),
//     NewObject('机台8'),
//     NewObject('机台9'),
//     NewObject('机台10'),
//     NewObject('机台11'),
//     NewObject('机台12'),
//     NewObject('机台13'),
//     NewObject('机台14'),
//     NewObject('机台15'),
//     NewObject('机台16'),
//     NewObject('机台17'),
//     NewObject('机台18'),
//     NewObject('机台19'),
//     NewObject('机台20')
//   ];
//
//   NewObject valueItem = items.first;
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//
//
//       // backgroundColor: Color(0xff3875F6),
//       backgroundColor: Colors.red,
//
//
//       body: Theme(
//         data: Theme.of(context).copyWith(
//           canvasColor: Colors.blueAccent,
//         ),
//         child: buildDropdown(),
//       ));
//
//   Widget buildDropdown() => Container(
//         // width: 100,
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         margin: EdgeInsets.all(10.0),
//         child: DropdownButtonHideUnderline(
//           child: DropdownButton<NewObject>(
//             value: valueItem, // currently selected item
//             enableFeedback: true,
//             icon: Icon(
//               Icons.arrow_drop_down,
//               color: Colors.white,
//             ),
//             items: items
//                 .map((item) => DropdownMenuItem<NewObject>(
//                       child: Row(
//                         children: [
//                           const SizedBox(width: 0),
//                           Text(
//                             item.title,
//                             style: TextStyle(
//                               // fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       value: item,
//                     ))
//                 .toList(),
//             onChanged: (value) => setState(() {
//               this.valueItem = value!;
//             }),
//           ),
//         ),
//       );
// }
