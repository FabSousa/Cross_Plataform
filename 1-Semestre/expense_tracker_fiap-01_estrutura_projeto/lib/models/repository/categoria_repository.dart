import 'package:expense_tracker_fiap/models/categoria.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../tipo_transacao.dart';

class CategoriaRepository {
  List<Categoria> obterCategorias() {
    return [
      Categoria(
        id: '1',
        nome: 'Casa',
        cor: Colors.deepPurple,
        icone: Ionicons.home_outline,
        tipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: '2',
        nome: 'Alimentação',
        cor: Colors.red,
        icone: Ionicons.fast_food_outline,
        tipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: '3',
        nome: 'Lazer',
        cor: Colors.orange,
        icone: Ionicons.game_controller_outline,
        tipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: '4',
        nome: 'Educação',
        cor: Colors.indigo,
        icone: Ionicons.book_outline,
        tipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: '5',
        nome: 'Animais de estimação',
        cor: Colors.brown,
        icone: Ionicons.paw_outline,
        tipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: '6',
        nome: 'Transporte',
        cor: Colors.blue,
        icone: Ionicons.bus_outline,
        tipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: '7',
        nome: 'Salário',
        cor: Colors.green,
        icone: Ionicons.cash_outline,
        tipoTransacao: TipoTransacao.receita,
      ),
      Categoria(
        id: '8',
        nome: 'Empréstimo',
        cor: Colors.cyan,
        icone: Ionicons.card_outline,
        tipoTransacao: TipoTransacao.receita,
      ),
      Categoria(
        id: '9',
        nome: 'Vendas',
        cor: Colors.green,
        icone: Ionicons.wallet_outline,
        tipoTransacao: TipoTransacao.receita,
      ),
    ];
  }
}
