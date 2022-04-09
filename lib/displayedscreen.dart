import 'package:flutter/material.dart';
import 'editabletable.dart';
import 'editableText.dart';
import 'editablechecklist.dart';
import 'editablenormaltable.dart';

class DisplayedScreen extends StatefulWidget {
  static int number = 0;
  @override
  _DisplayedScreenState createState() => _DisplayedScreenState();
}

class _DisplayedScreenState extends State<DisplayedScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: ListView(
          children: 
          DisplayedScreen.number == 0
              ? [EditableDataTable()]
              : DisplayedScreen.number == 2
                  ? [EditableTextBox()]
                  : DisplayedScreen.number == 3
                      ? [EditableCheckList()]
                      : [EditableNormalTable()],
        ),
      ),
    );
  }
}
