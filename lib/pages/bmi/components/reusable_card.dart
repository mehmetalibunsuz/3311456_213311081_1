import 'package:flutter/material.dart';
import 'package:health/components/constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, required this.cardChild, this.onPress});

  final Color colour;
  final Widget cardChild;
  void Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 150,
        width: 150,
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: cardChild,
      ),
    );
  }
}
