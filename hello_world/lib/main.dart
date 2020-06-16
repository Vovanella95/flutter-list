import 'package:flutter/material.dart';
import 'package:hello_world/pages/moviesList/moviesListPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                image: NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/000/582/542/non_2x/vector-abstract-template-black-frame-layout-metallic-red-light-on-dark-background-modern-luxury-futuristic-technology-concept.jpg"))),
        child: Align(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/6/6a/New-imdb-logo.png",
                    width: 160),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MoviesListPage()))
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
