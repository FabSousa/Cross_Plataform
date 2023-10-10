import 'package:cart_provider_demo/models/carrinho.dart';
import 'package:flutter/material.dart';

import '../../models/catalogo.dart';

class CarrinhoLista extends StatelessWidget {
  final CarrinhoModel carrinho;
  final void Function(Item item) onCarrinhoRemove;
  const CarrinhoLista(
      {Key? key, required this.carrinho, required this.onCarrinhoRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: CarrinhoLista');

    return ListView.builder(
      itemCount: carrinho.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Image(
          image: AssetImage(
            'images/${carrinho.items[index].imagem}.jpeg',
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.remove_circle_outline,
            color: Colors.red,
          ),
          onPressed: () {
            onCarrinhoRemove(carrinho.items[index]);
          },
        ),
        title: Text(
          carrinho.items[index].nome,
        ),
        subtitle: Text(
          'R\$ ${carrinho.items[index].preco}',
        ),
      ),
    );
  }
}
