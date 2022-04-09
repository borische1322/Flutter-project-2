import 'package:flutter/material.dart';
import 'package:notes/counterfile.dart';
import 'editablecell.dart';

String initialText = "Initial Text";

class EditableTextBox extends StatefulWidget {
  final CounterStorage storage = CounterStorage();
  

  Future<String> fetchdata() async {
      return storage.readCounter();
  }

  @override
  _EditableTextBoxState createState() => _EditableTextBoxState();
}

class _EditableTextBoxState extends State<EditableTextBox> {
  Future<String>? loadtext;
  bool loadFactor = false;

  @override
  void initState() {
    super.initState();
    loadtext = widget.fetchdata();
  }

  TextEditingController _editingController =
      TextEditingController(text: initialText);

  Widget _editTitleTextField() {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            EditableCell(fontSize: 25.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      initialText = "Initial Text";
                      _editingController.text = "Initial Text";
                    });
                  },
                  child: Icon(
                    Icons.new_label_outlined, // add custom icons also
                    size: 40,
                  ),
                ),
              ],
            ),
            TextField(
              maxLines: 39,
              minLines: 1,
              onChanged: (newValue) {
                setState(() {
                  initialText = newValue;
                  widget.storage.writeCounter(newValue);
                });
              },
              autofocus: true,
              controller: _editingController,
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: loadtext,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Text("Loading");
          default:
            if (snapshot.hasError) {
              return Text("Error");
            } else {
              initialText = '${snapshot.data}';
              if (initialText != "" && !loadFactor) {
                _editingController.text = snapshot.data.toString();
              }
              loadFactor = true;
              return Column(children: [_editTitleTextField(), Text("HIII")]);
            }
        }
      });
}
