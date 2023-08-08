import 'package:expense_tracker/models/categoria.dart';
import 'package:expense_tracker/models/conta.dart';
import 'package:expense_tracker/models/tipo_transacao.dart';

class Transacao {
  String id;
  String descricao;
  TipoTransacao tipoTransacao;
  double valor;
  DateTime data;
  String detalhes = '';
  Categoria categoria;
  Conta conta;

  Transacao({
    required this.id,
    required this.descricao,
    required this.tipoTransacao,
    required this.valor,
    required this.data,
    required this.categoria,
    required this.conta,
  });
}
