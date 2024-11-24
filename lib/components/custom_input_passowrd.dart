import 'package:flutter/material.dart';

class CustomInputPassword extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final String label;
  final String hintText;

  const CustomInputPassword({super.key, required this.controller, required this.textInputType, required this.label, required this.hintText});

  @override
  State<CustomInputPassword> createState() => _CustomInputPasswordState();
}

class _CustomInputPasswordState extends State<CustomInputPassword> {
  bool _isObscureText = true;

  _onClickObscureText() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: TextField(
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: _isObscureText,
        decoration: InputDecoration(
          label: const Text("Password"),
          hintText: "Password",
          suffixIcon: IconButton(
            onPressed: _onClickObscureText,
            icon: _isObscureText
                ? const Icon(Icons.visibility_off)
                : const Icon(Icons.visibility),
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
