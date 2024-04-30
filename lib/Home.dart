import 'package:flutter/material.dart';

import 'package:jelkovec_flutter_app/Prirodoslovni.dart';
import 'package:jelkovec_flutter_app/SkolaInfo.dart';
import 'package:jelkovec_flutter_app/Jezici.dart';
import 'package:jelkovec_flutter_app/Drustveni.dart';
import 'package:jelkovec_flutter_app/Electric.dart';
import 'package:jelkovec_flutter_app/Anketa.dart';

import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final String imagePath;
  final String text;
  final String route;

  ActivityCard({
    required this.imagePath,
    required this.text,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                imagePath,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 8),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/prirodoslovni': (context) => Prirodoslovni(),
        '/o_skoli': (context) => SkolaInfo(),
        '/jezici': (context) => Jezici(),
        '/drustveni': (context) => Drustveni(),
        '/electric': (context) => Electric(),
        '/anketa': (context) => Anketa(),
      },
      initialRoute: '/home',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Školske aktivnosti"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            children: [
              ActivityCard(
                imagePath: "android/assets/images/jelkovec.png",
                text: "O Srednjoj školi Jelkovec",
                route: "/o_skoli",
              ),
              ActivityCard(
                imagePath: "android/assets/images/electrical2.jpg",
                text: "Nastavne aktivnosti u elektrotehnici",
                route: "/electric",
              ),
              ActivityCard(
                imagePath: "android/assets/images/math.jpg",
                text: "Aktivnosti u prirodoslovnom području",
                route: "/prirodoslovni",
              ),
              ActivityCard(
                imagePath: "android/assets/images/languages.png",
                text: "Jezični aktiv",
                route: "/jezici",
              ),
              ActivityCard(
                imagePath: "android/assets/images/people.jpg",
                text: "Društvene aktivnosti",
                route: "/drustveni",
              ),
              ActivityCard(
                imagePath: "android/assets/images/anketa.jpg",
                text: "Informativna anketa",
                route: "/anketa",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
