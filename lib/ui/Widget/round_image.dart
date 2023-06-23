import 'package:flutter/material.dart';

class RoundImage extends StatelessWidget {
  String? image;
  double size;

  RoundImage({super.key, this.image, required this.size});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Image.network(
        image ??
            'https://cdn.pixabay.com/photo/2023/05/07/09/59/mountains-7976041_1280.jpg',
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
