import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
class Tzk extends StatelessWidget {

  final List<String> imagePaths = [
    'android/assets/images/bicikl.jpg',
    'android/assets/images/suma.jpg',
    'android/assets/images/suma2.jpg',
    'android/assets/images/klizanje1.jpg',
    'android/assets/images/klizanje2.jpg',
    'android/assets/images/bazen.jpg',

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fakultativna TZK'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 700),
              viewportFraction: 0.8,
            ),
            items: imagePaths.map((String imagePath) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  );
                },
              );
            }).toList(),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Tekst TZK... ',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.justify,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
