import 'package:as_sistemas_moveis/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final AuthService authService;

  const HomeScreen({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
        title: const Text(
          "Busque seu CEP",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              authService.logout(context);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      ),
    );
  }
}
