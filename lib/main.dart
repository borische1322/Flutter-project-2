import 'package:flutter/material.dart';
import 'stackscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blue[800],
          appBar: AppBar(
            title: Text("Boris's Note"),
            leading: GestureDetector(
              onTap: () {
                setState(() {
                  isCollapsed = !isCollapsed;
                  print(isCollapsed);
                });
              },
              child: Icon(
                Icons.menu, // add custom icons also
              ),
            ),
          ),
          body: StackScreen(isCollapsed)),
    );
  }
}
