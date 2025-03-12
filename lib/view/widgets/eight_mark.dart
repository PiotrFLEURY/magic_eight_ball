import 'package:flutter/material.dart';

class EightMark extends StatelessWidget {
  const EightMark({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: const Center(
        child: Text(
          '8',
          style: TextStyle(
            fontSize: 64,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
