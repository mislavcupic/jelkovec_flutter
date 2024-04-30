import 'package:flutter/material.dart';
import 'package:jelkovec_flutter_app/PrvaPomoc.dart';
import 'package:jelkovec_flutter_app/Robotika.dart';
import 'package:jelkovec_flutter_app/Tzk.dart';
import 'package:jelkovec_flutter_app/AmerickaKultura.dart';

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

class Izvannastavne extends StatelessWidget {
  const Izvannastavne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/prvapomoc': (context) => PrvaPomoc(),
        '/robotika': (context) => Robotika(),
        '/tzk': (context) => Tzk(),
        '/americka': (context) => AmerickaKultura(),
      },
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Izvannastavne aktivnosti"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            alignment: WrapAlignment.spaceAround,
            children: [
              ActivityCard(
                imagePath: "android/assets/images/robotics.jpg",
                text: "Robotika",
                route: "/robotika",
              ),
              ActivityCard(
                imagePath: "android/assets/images/firstaid.jpg",
                text: "Prva pomoć",
                route: "/prvapomoc",
              ),
              ActivityCard(
                imagePath: "android/assets/images/klizanje2.jpg",
                text: "TZK",
                route: "/tzk",
              ),
              ActivityCard(
                imagePath: "android/assets/images/people.jpg",
                text: "Američka kultura",
                route: "/americka",
              ),
              // Add more ActivityCard widgets as needed
            ],
          ),
        ),
      ),
    );
  }
}
