import 'package:expense_tracker/models/tipo_transacao.dart';
import 'package:flutter/material.dart';

class Categoria {
  int id;
  String descricao;
  Color cor = Colors.red;
  IconData icone;
  TipoTransacao tipoTransacao;

  Categoria({
    required this.id,
    required this.descricao,
    required this.cor,
    required this.icone,
    required this.tipoTransacao,
  });
}
