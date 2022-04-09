import 'package:flutter/material.dart';
import 'displayedscreen.dart';

class StackScreen extends StatefulWidget {
  final bool isCollapsed;
  StackScreen(this.isCollapsed);
  @override
  _StackScreenState createState() => _StackScreenState();
}

class _StackScreenState extends State<StackScreen> {
  double screenWidth = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    return Stack(
      children: [
        Padding(
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
                InkWell(
                  onTap: () {
                    setState(() {
                      DisplayedScreen.number = 1;
                    });
                  },
                  child: Text(
                    'Table',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      DisplayedScreen.number = 2;
                    });
                  },
                  child: Text(
                    'Note',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      DisplayedScreen.number = 3;
                    });
                  },
                  child: Text(
                    'Check List',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'something else idk',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ],
            )),
        displayedscreenon(context, screenWidth, widget.isCollapsed),
      ],
    );
  }
}

Widget displayedscreenon(context, width, isCollapsedMenu) {
  return AnimatedPositioned(
    duration: Duration(milliseconds: 200),
    left: isCollapsedMenu ? 0 : 0.6 * width,
    right: isCollapsedMenu ? 0 : -0.4 * width,
    top: 0,
    bottom: 0,
    child: DisplayedScreen(),
  );
}
