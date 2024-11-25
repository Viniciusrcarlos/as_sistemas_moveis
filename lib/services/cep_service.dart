import 'dart:convert';
import 'package:as_sistemas_moveis/models/cep.dart';
import 'package:http/http.dart' as http;

class CepService{
  Future<Cep> buscarCep(String cep) async {
    final response = await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      if (jsonResponse.containsKey('erro')) {
        throw Exception('CEP inválido ou não encontrado.');
      }

      return Cep.fromJson(jsonResponse);
    } else {
      throw Exception("Erro ao buscar o CEP. Código: ${response.statusCode}");
    }
  }

}