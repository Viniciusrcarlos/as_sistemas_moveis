import 'package:as_sistemas_moveis/services/auth_service.dart';
import 'package:as_sistemas_moveis/services/cep_service.dart';
import 'package:as_sistemas_moveis/models/cep.dart';
import 'package:flutter/material.dart';

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
        _cepData = cep as Cep?;
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
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Digite o CEP que deseja buscar",
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _buscarCep,
                child: const Text("BUSCAR CEP"),
              ),
              const SizedBox(height: 16),
              if (_cepData != null) ...[
                Text('CEP: ${_cepData!.cep}', style: const TextStyle(fontSize: 18)),
                Text('Logradouro: ${_cepData!.logradouro}', style: const TextStyle(fontSize: 18)),
                Text('Bairro: ${_cepData!.bairro}', style: const TextStyle(fontSize: 18)),
                Text('Localidade: ${_cepData!.localidade}', style: const TextStyle(fontSize: 18)),
                Text('UF: ${_cepData!.uf}', style: const TextStyle(fontSize: 18)),
              ],
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
