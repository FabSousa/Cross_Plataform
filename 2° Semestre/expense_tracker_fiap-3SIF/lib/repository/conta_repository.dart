import 'package:expense_tracker/models/conta.dart';

class ContaRepository {
  List<Conta> getContas() {
    return [
      Conta(
          id: "1",
          bancoId: "bb",
          descricao: "Conta 1",
          tipoConta: TipoConta.contaCorrente),
      Conta(
          id: "2",
          bancoId: "bmg",
          descricao: "Conta 2",
          tipoConta: TipoConta.contaPoupanca),
          Conta(
          id: "3",
          bancoId: "itau",
          descricao: "Conta 3",
          tipoConta: TipoConta.contaInvestimento),
    ];
  }
}
