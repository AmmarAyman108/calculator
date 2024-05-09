import 'package:flutter/material.dart';

class Output extends StatelessWidget {
  const Output({
    super.key,
    required this.text,
    required this.alignment,
  });
  final String text;
  final AlignmentGeometry alignment;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
      alignment: alignment,
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
