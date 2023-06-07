import 'package:flutter/material.dart';
import 'package:health/components/constants.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        style: const TextStyle(color: Colors.white, fontSize: 18),
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade900,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade900),
            ),
            fillColor: Colors.grey.shade800,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey.shade500)),
        cursorColor: Colors.white,
      ),
    );
  }
}
