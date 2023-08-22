import 'package:expense_tracker/models/conta.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../models/categoria.dart';
import '../models/tipo_transacao.dart';
import '../models/transacao.dart';

class TransacoesReepository {
  List<Transacao> listarTransacoes() {
    return [
      Transacao(
        id: '1',
        descricao: 'Conta de luz',
        data: DateTime.now(),
        tipoTransacao: TipoTransacao.despesa,
        valor: 150.00,
        categoria: Categoria(
          id: 1,
          descricao: 'Casa',
          cor: Colors.deepPurple,
          icone: Ionicons.home_outline,
          tipoTransacao: TipoTransacao.despesa,
        ),
        conta: Conta(
          id: '1',
          descricao: 'Conta corrente',
          bancoId: 'bb',
          tipoConta: TipoConta.contaCorrente,
        ),
      ),
      Transacao(
        id: '3',
        descricao: 'Conta de internet',
        data: DateTime.now(),
        valor: 200.00,
        tipoTransacao: TipoTransacao.despesa,
        categoria: Categoria(
          id: 1,
          descricao: 'Casa',
          cor: Colors.deepPurple,
          icone: Ionicons.home_outline,
          tipoTransacao: TipoTransacao.despesa,
        ),
        conta: Conta(
          id: '1',
          descricao: 'Conta corrente',
          bancoId: 'bb',
          tipoConta: TipoConta.contaCorrente,
        ),
      ),
      Transacao(
        id: '6',
        descricao: 'Conta de mercado',
        data: DateTime.now(),
        tipoTransacao: TipoTransacao.despesa,
        valor: 100.00,
        categoria: Categoria(
          id: 2,
          descricao: 'Alimentação',
          cor: Colors.red,
          icone: Ionicons.fast_food_outline,
          tipoTransacao: TipoTransacao.despesa,
        ),
        conta: Conta(
          id: '1',
          descricao: 'Conta corrente',
          bancoId: 'bb',
          tipoConta: TipoConta.contaCorrente,
        ),
      ),
      Transacao(
        id: '7',
        descricao: 'Conta de restaurante',
        data: DateTime.now(),
        tipoTransacao: TipoTransacao.despesa,
        valor: 100.00,
        categoria: Categoria(
          id: 2,
          descricao: 'Alimentação',
          cor: Colors.red,
          icone: Ionicons.fast_food_outline,
          tipoTransacao: TipoTransacao.despesa,
        ),
        conta: Conta(
          id: '1',
          descricao: 'Conta corrente',
          bancoId: 'bb',
          tipoConta: TipoConta.contaCorrente,
        ),
      ),
      Transacao(
        id: '8',
        descricao: 'Conta de bar',
        data: DateTime.now(),
        valor: 100.00,
        tipoTransacao: TipoTransacao.despesa,
        categoria: Categoria(
          id: 3,
          descricao: 'Lazer',
          cor: Colors.orange,
          icone: Ionicons.game_controller_outline,
          tipoTransacao: TipoTransacao.despesa,
        ),
        conta: Conta(
          id: '1',
          descricao: 'Conta corrente',
          bancoId: 'bb',
          tipoConta: TipoConta.contaCorrente,
        ),
      ),
      Transacao(
        id: '9',
        descricao: 'Conta de cinema',
        data: DateTime.now(),
        valor: 100.00,
        tipoTransacao: TipoTransacao.despesa,
        categoria: Categoria(
          id: 3,
          descricao: 'Lazer',
          cor: Colors.orange,
          icone: Ionicons.game_controller_outline,
          tipoTransacao: TipoTransacao.despesa,
        ),
        conta: Conta(
          id: '1',
          descricao: 'Conta corrente',
          bancoId: 'bb',
          tipoConta: TipoConta.contaCorrente,
        ),
      ),
      Transacao(
        id: '12',
        descricao: 'Conta de faculdade',
        data: DateTime.now(),
        valor: 100.00,
        tipoTransacao: TipoTransacao.despesa,
        categoria: Categoria(
          id: 4,
          descricao: 'Educação',
          cor: Colors.indigo,
          icone: Ionicons.book_outline,
          tipoTransacao: TipoTransacao.despesa,
        ),
        conta: Conta(
          id: '1',
          descricao: 'Conta corrente',
          bancoId: 'bb',
          tipoConta: TipoConta.contaCorrente,
        ),
      ),
      Transacao(
        id: '13',
        descricao: 'Salário',
        data: DateTime.now(),
        valor: 2300.00,
        tipoTransacao: TipoTransacao.receita,
        categoria: Categoria(
          id: 7,
          descricao: 'Salário',
          cor: Colors.green,
          icone: Ionicons.cash_outline,
          tipoTransacao: TipoTransacao.receita,
        ),
        conta: Conta(
          id: '2',
          descricao: 'Conta poupança',
          bancoId: 'caixa',
          tipoConta: TipoConta.contaCorrente,
        ),
      ),
    ];
  }
}
