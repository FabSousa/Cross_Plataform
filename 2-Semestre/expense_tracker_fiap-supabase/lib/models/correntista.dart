class Correntista {
  int id;
  int contaId;
  String nome;
  String cpf;
  String email;
  String? celular;

  Correntista(
      {required this.id,
      required this.contaId,
      required this.nome,
      required this.cpf,
      required this.email,
      this.celular});

  factory Correntista.fromMap(Map<String, dynamic> map) {
    return Correntista(
      id: map['id'],
      contaId: map['conta_id'],
      nome: map['nome'],
      cpf: map['cpf'],
      email: map['email'],
      celular: map['celular'],
    );
  }
}
