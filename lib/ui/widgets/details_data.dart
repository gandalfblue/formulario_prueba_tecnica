import 'package:flutter/material.dart';

class DetailsDataWidget extends StatelessWidget {
  final String description;
  final String tittle;
  final double size;
  final bool fontWeight;

  const DetailsDataWidget({
    super.key,
    required this.tittle,
    required this.size,
    required this.fontWeight,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
        fontWeight
            ? Text(
                tittle,
                style: TextStyle(
                    fontSize: size,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            : Text(
                tittle,
                style: TextStyle(fontSize: size, color: Colors.black),
              )
      ],
    );
  }
}
