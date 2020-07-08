import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hello_world/dependencies.dart';
import 'package:hello_world/locale/locales.dart';
import 'package:hello_world/services/navigation/routes.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StartPage createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/dark-low-poly-background_1048-7971.jpg'))),
        child: Align(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/New-imdb-logo.png',
                  width: 120,
                ),
                SizedBox(height: 16),
                FutureBuilder(
                  future:
                      rootBundle.loadString('assets/strings/welcomeText.txt'),
                  builder: (context, snapshot) => Text(
                    snapshot.data.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  ImdbLocalizations.of(context).description,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () => {
                              getNavigationService()
                                  .navigateTo(moviesListRoute, null)
                            },
                        child: Text("Start NOW!"),
                        color: Color.fromRGBO(245, 198, 24, 1),
                        textColor: Colors.black),
                    SizedBox(width: 16),
                    FlatButton(
                        onPressed: () => {},
                        child: Text("Maybe later"),
                        textColor: Color.fromRGBO(245, 198, 24, 1))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
