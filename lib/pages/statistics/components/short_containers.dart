import 'package:flutter/material.dart';

class ShortContainer extends StatelessWidget {
  final color;

  const ShortContainer({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: color,
      ),
    );
  }
}
