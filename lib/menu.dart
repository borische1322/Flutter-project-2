import 'package:flutter/material.dart';
import 'package:notes/displayedscreen.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
                onTap: () {
                  setState(() {
                    DisplayedScreen.number = 0;  
                  });
                  
                },
                child: Text(
                  'Data Table',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                )),
            SizedBox(
              height: 10.0,
            ),
            InkWell(onTap: () {
              setState(() {
                DisplayedScreen.number = 1;
              });
              
            },
            child:Text(
              'Table',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ) ,),
            SizedBox(
              height: 10.0,
            ),
            InkWell(onTap: () {
              setState(() {
                DisplayedScreen.number = 2;
              });
              
            },
            child:Text(
              'Note',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ) ,)
            ,
            SizedBox(
              height: 10.0,
            ),
            Text(
              'List',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'something else idk',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ));
  }
}
