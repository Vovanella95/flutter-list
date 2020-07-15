import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OpenClosedPanel extends StatefulWidget {
  @override
  _OpenClosedPanelState createState() => _OpenClosedPanelState();
}

class _OpenClosedPanelState extends State<OpenClosedPanel> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        isOpen ? "I am opened" : "I am closed",
        textDirection: TextDirection.ltr,
      ),
      onTap: () {
        setState(() {
          isOpen = !isOpen;
        });
      },
    );
  }
}
