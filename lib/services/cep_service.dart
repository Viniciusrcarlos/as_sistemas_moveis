import 'dart:convert';
import 'package:as_sistemas_moveis/models/cep.dart';
import 'package:http/http.dart' as http;

class CepService{
  Future<List<Cep>> buscarCep(String cep) async {
    final response = await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));

    if (response.statusCode == 200) {  // Se der tudo supimpa
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Cep.fromJson(item)).toList();
    } else {
      throw Exception("Erro ao lançar lista de Cep, tente outro :D");
    }
  }
}