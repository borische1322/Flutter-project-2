import 'package:flutter/material.dart';

class EditableCell extends StatefulWidget {
  final double fontSize;


  EditableCell({this.fontSize = 18.0});
  @override
  _EditableCellState createState() => _EditableCellState();
}

class _EditableCellState extends State<EditableCell> {
  bool _isEditingText = false;
  String initialText = "Initial Text";
  TextEditingController _editingController =
      TextEditingController(text: "Initial Text");

  Widget _editTitleTextField() {
    if (_isEditingText)
      return Center(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              initialText = newValue;
              _isEditingText = false;
            });
          },
          autofocus: true,
          controller: _editingController,
        ),
      );
    return InkWell(
        onTap: () {
          setState(() {
            _isEditingText = true;
          });
        },
        child: Text(
          initialText,
          style: TextStyle(
            color: Colors.black,
            fontSize: widget.fontSize,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _editTitleTextField(),
    );
  }
}
