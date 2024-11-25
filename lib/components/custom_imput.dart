import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String label;
  final String hintText;

  const CustomInput({super.key, required this.controller, required this.textInputType, required this.label, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          label: Text(label),
          hintText: hintText,
          
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
