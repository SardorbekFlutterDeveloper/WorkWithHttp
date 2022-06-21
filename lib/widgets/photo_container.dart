
import 'package:flutter/material.dart';


class PhotoContainer extends StatelessWidget {
  const PhotoContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.amber
        ),
      ),
    );
  }
}
