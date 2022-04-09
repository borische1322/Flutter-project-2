import 'package:flutter/material.dart';
import 'editablecell.dart';

class EditableDataTable extends StatefulWidget {

  @override
  _EditableDataTableState createState() => _EditableDataTableState();
}

class _EditableDataTableState extends State<EditableDataTable> {
  List<DataRow> rowsofeditablecell = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DataTable(
          columns: <DataColumn>[
            DataColumn(
              label: Text(
                'Name',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Age',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Role',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: rowsofeditablecell,
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      rowsofeditablecell.add(DataRow(
                        cells: <DataCell>[
                          DataCell(
                            EditableCell(),
                            showEditIcon: true,
                          ),
                          DataCell(
                            EditableCell(),
                            showEditIcon: true,
                          ),
                          DataCell(
                            EditableCell(),
                            showEditIcon: true,
                          ),
                        ],
                      ));
                    });
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
