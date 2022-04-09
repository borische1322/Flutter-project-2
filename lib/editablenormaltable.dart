import 'package:flutter/material.dart';

import 'editablecell.dart';

class EditableNormalTable extends StatefulWidget {
  @override
  _EditableNormalTableState createState() => _EditableNormalTableState();
}

List<TableRow> numberOfRow = [];

class _EditableNormalTableState extends State<EditableNormalTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
        child: Column(children: [
          Table(
            border: TableBorder.all(),
            children: numberOfRow,
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    numberOfRow.add(TableRow(children: [
                      Container(
                        child: EditableCell(),
                      ),
                      Container(child: EditableCell()),
                    ]));
                  });
                },
                icon: Icon(Icons.add_circle_rounded)),
          ),
        ]));
  }
}
