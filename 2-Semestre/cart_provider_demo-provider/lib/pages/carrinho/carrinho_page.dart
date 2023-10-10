import 'package:cart_provider_demo/pages/carrinho/carrinho_lista.dart';
import 'package:cart_provider_demo/pages/carrinho/carrinho_total.dart';
import 'package:flutter/material.dart';

class CarrinhoPage extends StatelessWidget {
  const CarrinhoPage({Key? key}) : super(key: key);

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
              child: CarrinhoLista(),
            ),
          ),
          const Divider(height: 4, color: Colors.black),
          CarrinhoTotal()
        ],
      ),
    );
  }
}
