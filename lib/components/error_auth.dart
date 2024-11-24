import 'package:flutter/material.dart';

class ErrorAuth extends StatefulWidget {
  final ValueNotifier<bool> listenable;
  final String messageError;

  const ErrorAuth(
      {super.key, required this.listenable, required this.messageError});

  @override
  State<ErrorAuth> createState() => _ErrorAuthState();
}

class _ErrorAuthState extends State<ErrorAuth> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.listenable,
      builder: (context, error, _) {
        if (error) {
          return Text(
            widget.messageError,
            style: const TextStyle(
              color: Colors.red,
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
