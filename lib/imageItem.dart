import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class AbstractImageItem extends StatelessWidget {
  String src;
  String title;
  String description;

  AbstractImageItem(this.src, this.title, this.description);

  @override
  Widget build(BuildContext context);
}

class ImageItem extends AbstractImageItem {
  ImageItem(String src, String title, String description)
      : super(src, title, description);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 16),
            ),
            Image.asset(
              src,
            ),
          ],
        ),
      ),
    );
  }
}

class ImageManager {
  List<AbstractImageItem> _images = [];

  void addImage(AbstractImageItem image) {
    _images.add(image);
  }

  void removeImage(int index) {
    _images.removeAt(index);
  }

  List<AbstractImageItem> getAllImages() {
    return _images;
  }
}
