import 'package:flutter/material.dart';

class MidComp extends StatelessWidget {
  final String image;
  final String text;
  void Function()? onTap;
  MidComp(
      {super.key,
      required this.image,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 220,
        width: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              image,
              height: 220,
              width: 185,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white.withOpacity(0.4),
                fontSize: 30,
                fontFamily: 'Bungee'),
          )
        ]),
      ),
    );
  }
}
