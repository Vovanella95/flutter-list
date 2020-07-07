import 'package:flutter/material.dart';
import 'package:hello_world/pages/movieDetailsPage/movieDetailsPage.dart';
import 'package:hello_world/pages/moviesList/moviesListPage.dart';
import 'package:hello_world/services/navigation/router.dart';
import 'package:hello_world/services/navigation/routes.dart';

import 'dependencies.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: getNavigationService().navigatorKey,
      onGenerateRoute: Router.generateRoute,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/dark-low-poly-background_1048-7971.jpg'))),
        child: Align(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/New-imdb-logo.png', width: 120,),
                SizedBox(height: 16),
                Text(
                  "Welcome to IMDB Official site. Here you can find a lot of interesting things, Movies, Series and other kinds of entertament",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FlatButton(
                        onPressed: () => {
                              getNavigationService().navigateTo(moviesListRoute, null)
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

class MoviesListRoute {}
