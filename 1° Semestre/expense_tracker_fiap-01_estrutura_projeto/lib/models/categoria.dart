import 'package:expense_tracker_fiap/models/tipo_transacao.dart';
import 'package:flutter/material.dart';

class Categoria {
  String id;
  String nome;
  IconData icone;
  Color cor;
  TipoTransacao tipoTransacao;

  Categoria({
    required this.id,
    required this.nome,
    required this.icone,
    required this.cor,
    required this.tipoTransacao,
  });
}
