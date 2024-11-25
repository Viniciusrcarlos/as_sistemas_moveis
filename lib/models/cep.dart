class Cep{
  final String cep;
  final String bairro;
  final String uf;
  final String estado;
  final String localidade;
  final String logradouro;
  final String complemento;
  final String unidade;
  final String regiao;
  final String ibge;
  final String gia;
  final String ddd;

  const Cep({
    required this.cep,
    required this.logradouro,
    required this.complemento,
    required this.unidade,
    required this.bairro,
    required this.localidade,
    required this.uf,
    required this.estado,
    required this.regiao,
    required this.ibge,
    required this.gia,
    required this.ddd
  });

  factory Cep.fromJson(Map<String, dynamic> json){
    return Cep(
        cep: json["cep"],
        logradouro: json["logradouro"],
        complemento: json["complemento"],
        unidade: json["unidade"],
        bairro: json["bairro"],
        localidade: json["localidade"],
        uf: json["uf"],
        estado: json["estado"],
        regiao: json["regiao"],
        ibge: json["ibge"],
        gia: json["gia"],
        ddd: json["ddd"]
    );
  }
}