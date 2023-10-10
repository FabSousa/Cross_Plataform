import 'package:cart_provider_demo/models/catalogo.dart';
import 'package:cart_provider_demo/pages/catalogo/catalogo_item.dart';
import 'package:flutter/material.dart';

import '../../models/carrinho.dart';
import 'catalogo_appbar.dart';

class CatalogoPage extends StatelessWidget {
  final CarrinhoModel carrinho;
  final void Function(Item item) onCarrinhoAdd;

  const CatalogoPage(
      {Key? key, required this.carrinho, required this.onCarrinhoAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: CatalogoPage');

    return Scaffold(
      appBar: CatalogoAppBar(
        carrinho: carrinho,
      ),
      body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: .63,
          padding: const EdgeInsets.all(10),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 10,
          children: CatalogoModel.items.map((Item item) {
            return CatalogoItem(
              item: item,
              carrinho: carrinho,
              onCarrinhoAdd: onCarrinhoAdd,
            );
          }).toList()),
    );
  }
}
