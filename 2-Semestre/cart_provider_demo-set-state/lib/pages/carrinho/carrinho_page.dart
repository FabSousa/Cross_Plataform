import 'package:cart_provider_demo/models/carrinho.dart';
import 'package:cart_provider_demo/pages/carrinho/carrinho_lista.dart';
import 'package:cart_provider_demo/pages/carrinho/carrinho_total.dart';
import 'package:flutter/material.dart';

import '../../models/catalogo.dart';

class CarrinhoPage extends StatelessWidget {
  final CarrinhoModel carrinho;
  final void Function(Item item) onCarrinhoRemove;
  const CarrinhoPage(
      {Key? key, required this.carrinho, required this.onCarrinhoRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: CarrinhoPage');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Carrinho'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: CarrinhoLista(
                carrinho: carrinho,
                onCarrinhoRemove: onCarrinhoRemove,
              ),
            ),
          ),
          const Divider(height: 4, color: Colors.black),
          CarrinhoTotal(
            carrinho: carrinho,
          )
        ],
      ),
    );
  }
}
