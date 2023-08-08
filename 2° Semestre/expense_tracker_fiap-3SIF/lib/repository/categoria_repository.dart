import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../models/categoria.dart';
import '../models/tipo_transacao.dart';

class CategoriaRepository {
  List<Categoria> listarCategorias() {
    return [
      Categoria(
        id: 1,
        descricao: 'Casa',
        cor: Colors.deepPurple,
        icone: Ionicons.home_outline,
        tipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: 2,
        descricao: 'Alimentação',
        cor: Colors.red,
        icone: Ionicons.fast_food_outline,
        tipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: 3,
        descricao: 'Lazer',
        cor: Colors.orange,
        icone: Ionicons.game_controller_outline,
        tipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: 4,
        descricao: 'Educação',
        cor: Colors.indigo,
        icone: Ionicons.book_outline,
        tipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: 5,
        descricao: 'Animais de estimação',
        cor: Colors.brown,
        icone: Ionicons.paw_outline,
        tipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: 6,
        descricao: 'Transporte',
        cor: Colors.blue,
        icone: Ionicons.bus_outline,
        tipoTransacao: TipoTransacao.despesa,
      ),
      Categoria(
        id: 7,
        descricao: 'Salário',
        cor: Colors.green,
        icone: Ionicons.cash_outline,
        tipoTransacao: TipoTransacao.receita,
      ),
      Categoria(
        id: 8,
        descricao: 'Empréstimo',
        cor: Colors.cyan,
        icone: Ionicons.card_outline,
        tipoTransacao: TipoTransacao.receita,
      ),
      Categoria(
        id: 9,
        descricao: 'Vendas',
        cor: Colors.green,
        icone: Ionicons.wallet_outline,
        tipoTransacao: TipoTransacao.receita,
      ),
    ];
  }
}
