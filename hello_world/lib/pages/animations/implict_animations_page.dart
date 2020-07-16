import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImplictAnimationsPage extends StatefulWidget {
  ImplictAnimationsPage();

  @override
  State<StatefulWidget> createState() => _ImplictAnimationsPageState();
}

class _ImplictAnimationsPageState extends State<ImplictAnimationsPage> {
  double _iconWidth = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            "https://wallpaperplay.com/walls/full/c/b/e/210869.jpg",
            alignment: Alignment.bottomLeft,
            fit: BoxFit.cover,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInCirc,
                width: _iconWidth,
                child: Image.network(
                    "https://vgboxart.com/resources/logo/16277_assassins-creed-valhalla-prev.png"),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _iconWidth += 40;
          });
        },
        child: Text("+"),
      ),
    );
  }
}
