import 'package:flutter/material.dart';

class FilterSelectTable extends StatefulWidget {
  final String title;

  const FilterSelectTable({
    required this.title,
  });

  @override
  _FilterSelectTableState createState() => _FilterSelectTableState();
}

class NewObject {
  final String title;
  final IconData icon;

  NewObject(this.title, this.icon);
}

class _FilterSelectTableState extends State<FilterSelectTable> {
  static final List<NewObject> items = <NewObject>[
    NewObject('Apple', Icons.access_alarms),
    NewObject('Banana', Icons.mail),
    NewObject('Orange', Icons.account_balance_wallet),
    NewObject('Other Fruit', Icons.account_box),
  ];

  NewObject valueItem = items.first;

  @override
  Widget build(BuildContext context) => AspectRatio(
        aspectRatio: 1,
        // backgroundColor: Colors.black,
        // appBar: AppBar(
        //   title: Text(widget.title),
        // ),
        // body: Center(
        child: buildDropdown(),
        // ),
      );

  Widget buildDropdown() => Container(
        width: 200,
        // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          border: Border.all(color: Colors.deepOrange, width: 4),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<NewObject>(
            value: valueItem, // currently selected item
            items: items
                .map((item) => DropdownMenuItem<NewObject>(
                      child: Row(
                        children: [
                          Icon(item.icon),
                          const SizedBox(width: 8),
                          Text(
                            item.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      value: item,
                    ))
                .toList(),
            onChanged: (value) => setState(() {
              this.valueItem = value!;
            }),
          ),
        ),
      );
}
