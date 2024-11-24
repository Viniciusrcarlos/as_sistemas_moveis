import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  final ValueListenable listenable;
  final String textButton;
  final VoidCallback action;

  const CustomLoading(
      {super.key,
        required this.listenable,
        required this.textButton,
        required this.action});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: listenable,
      builder: (context, isLoading, _) {
        return ElevatedButton(
          onPressed: isLoading ? null : action,
          child: !isLoading
              ? Text(textButton)
              : const CircularProgressIndicator(),
        );
      },
    );
  }
}
