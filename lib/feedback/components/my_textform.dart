import 'package:flutter/material.dart';
import 'package:health/components/constants.dart';

class MyTextForm extends StatefulWidget {
  final controller;
  final String hintText;
  const MyTextForm({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  State<MyTextForm> createState() => _MyTextFormState();
}

class _MyTextFormState extends State<MyTextForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 370,
      child: TextFormField(
        style: const TextStyle(color: Colors.white, fontSize: 18),
        controller: widget.controller,
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
            hintText: widget.hintText,
            hintStyle: kLabelTextStyle),
        cursorColor: Colors.white,
      ),
    );
  }
}
