import 'package:flutter/cupertino.dart';

class ExplictAnimationsPage extends StatefulWidget {
  ExplictAnimationsPage();

  @override
  State<StatefulWidget> createState() => _ExplictAnimationsPage();
}

class _ExplictAnimationsPage extends State<ExplictAnimationsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _nicolasController;

  @override
  void initState() {
    super.initState();
    _nicolasController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this)
          ..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: nicolasCageHead(),
      ),
    );
  }

  Widget nicolasCageHead() {
    return RotationTransition(
      alignment: Alignment.center,
      turns: _nicolasController,
      child: Image.network("https://i.imgur.com/Z0Mxvsj.png"),
    );
  }

  @override
  void dispose() {
    _nicolasController.dispose();
    super.dispose();
  }
}
