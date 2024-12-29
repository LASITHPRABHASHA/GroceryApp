import 'package:flutter/material.dart';

class MyImageDisplay extends StatelessWidget {
  final String image;

  const MyImageDisplay({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Hero(
        tag: image,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
