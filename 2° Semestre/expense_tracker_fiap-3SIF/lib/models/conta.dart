class Conta {
  final String id;
  final String bancoId;
  final String descricao;
  final TipoConta tipoConta;

  Conta(
      {required this.id,
      required this.bancoId,
      required this.descricao,
      required this.tipoConta});
}

enum TipoConta { contaCorrente, contaPoupanca, contaInvestimento }
