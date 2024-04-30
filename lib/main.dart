import 'package:flutter/material.dart';
import 'package:jelkovec_flutter_app/AktivnostiTrziste.dart';
import 'package:jelkovec_flutter_app/IzracunBodova.dart';
import 'package:jelkovec_flutter_app/SkolaInfo.dart';
import 'package:jelkovec_flutter_app/HomePage.dart';
import 'package:jelkovec_flutter_app/Home.dart';
import 'package:jelkovec_flutter_app/Izvannastavne.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/homepage',
      routes: {
        "/homepage": (context) => HomePage(),
        '/home': (context) => Home(), // Define a route for the new screen
        '/izracunbodovi': (context) => IzracunBodova(),
        'o_skoli': (context) => SkolaInfo(),
        'aktivnostitrziste':(context) => AktivnostiTrziste()
      },
      home: HomePage(),
    );
  }
}

