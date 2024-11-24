class Cep{
  final String cep;
  final String bairro;
  final String uf;
  final String estado;
  final String localidade;

  const Cep({required this.cep, required this.bairro, required this.uf, required this.estado, required this.localidade});

  factory Cep.fromJson(Map<String, dynamic> json){
    return Cep(cep: json["cep"], bairro: json["bairro"], uf: json["uf"], estado: json["estado"], localidade: json["localidade"]);
  }
}