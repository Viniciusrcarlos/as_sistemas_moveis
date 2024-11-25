import 'dart:convert';

import 'package:as_sistemas_moveis/services/auth_service.dart';
import 'package:as_sistemas_moveis/services/cep_service.dart';
import 'package:as_sistemas_moveis/models/cep.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  final AuthService authService;

  const HomeScreen({
    super.key,
    required this.authService,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CepService cepService = CepService();
  final TextEditingController _cepController = TextEditingController();
  Cep? _cepData;
  String? _errorMessage;

  void _buscarCep() async {
    setState(() {
      _cepData = null;
      _errorMessage = null;
    });

    try {
      final cep = await cepService.buscarCep(_cepController.text.trim());
      setState(() {
        _cepData = cep; // Sem necessidade de "as Cep?"
      });
    } catch (error) {
      setState(() {
        _errorMessage = 'Erro ao buscar o CEP. Verifique se está correto.';
      });
    }
  }




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
                widget.authService.logout(context);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _cepController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Digite o CEP que deseja buscar",
                  labelStyle: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                  hintText: "Ex: 01001000",
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black12, width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black12, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.black, width: 1.5),
                  ),
                  suffixIcon: const Icon(
                    Icons.search,
                    color: Colors.black54,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _buscarCep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                child: const Text(
                  "BUSCAR CEP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              if (_cepData != null)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    border: Border.all(color: Colors.black12, width: 1),
                  ),
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CEP: ${_cepData!.cep}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      Text('Logradouro: ${_cepData!.logradouro}', style: const TextStyle(fontSize: 20)),
                      Text('Bairro: ${_cepData!.bairro}', style: const TextStyle(fontSize: 20)),
                      Text('Localidade: ${_cepData!.localidade}', style: const TextStyle(fontSize: 20)),
                      Text('UF: ${_cepData!.uf}', style: const TextStyle(fontSize: 20)),
                      Text('Região: ${_cepData!.regiao}', style: const TextStyle(fontSize: 20)),
                      Text('DDD: ${_cepData!.ddd}', style: const TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red, fontSize: 16),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
