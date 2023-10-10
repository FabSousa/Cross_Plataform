import 'package:cart_provider_demo/models/carrinho.dart';
import 'package:cart_provider_demo/models/catalogo.dart';
import 'package:flutter/material.dart';

class CatalogoItem extends StatelessWidget {
  final Item item;
  final CarrinhoModel carrinho;
  final void Function(Item item) onCarrinhoAdd;

  const CatalogoItem(
      {Key? key,
      required this.item,
      required this.carrinho,
      required this.onCarrinhoAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: CatalogoItem ${item.id}');

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image(
                  image: AssetImage(
                    'images/${item.imagem}.jpeg',
                  ),
                  width: double.infinity,
                )),
          ),
          Text(
            item.nome,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            item.marca,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "R\$${item.preco}",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              _AddButton(
                item: item,
                carrinho: carrinho,
                onCarrinhoAdd: onCarrinhoAdd,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  final Item item;
  final CarrinhoModel carrinho;
  final void Function(Item item) onCarrinhoAdd;

  const _AddButton(
      {Key? key,
      required this.item,
      required this.carrinho,
      required this.onCarrinhoAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: _AddButton ${item.id}');

    var adicionado = carrinho.items.contains(item);

    return IconButton(
      icon: adicionado
          ? const Icon(
              Icons.check,
              color: Colors.green,
            )
          : const Icon(Icons.add_shopping_cart),
      onPressed: adicionado
          ? null
          : () {
              onCarrinhoAdd(item);
            },
    );
  }
}
