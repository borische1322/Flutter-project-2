import 'package:flutter/material.dart';
import 'editablecell.dart';

class EditableCheckList extends StatefulWidget {
  @override
  _EditableCheckListState createState() => _EditableCheckListState();
}

class _EditableCheckListState extends State<EditableCheckList> {
  List<int> rowsofeditablecell = [];
  List<int> selectitems = [];

  int x = 0;

  String listTitle = '';

  onSelectRow(bool select, int index) {
    setState(() {
      if (select) {
        selectitems.add(index);
      } else {
        selectitems.remove(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return listTitle == ''? 
    Column(
      children: [Text("CheckList's title: ", style: TextStyle(fontSize: 20)),
        TextField(
          onSubmitted: (newValue) {
            setState(() {
              listTitle = newValue;
            });
          },
          autofocus: true,
        )]) : Column(
      children: [
        DataTable(
          showCheckboxColumn: true,
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                listTitle,
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: rowsofeditablecell
              .map((index) => DataRow(
                    selected: selectitems.contains(index),
                    onSelectChanged: (bool? isSelected) {
                      if (isSelected != null) {
                        onSelectRow(isSelected, index);
                      }
                    },
                    cells: <DataCell>[
                      DataCell(
                        EditableCell(),
                        showEditIcon: true,
                      ),
                    ],
                  ))
              .toList(),
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: IconButton(
                  onPressed: () {
                    int index = x;
                    setState(() {
                      rowsofeditablecell.add(index);
                    });
                    x++;
                  },
                  icon: Icon(Icons.add_circle_rounded)),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
