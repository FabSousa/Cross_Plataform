import 'package:flutter/material.dart';
import '../../models/carrinho.dart';

class CatalogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CarrinhoModel carrinho;
  const CatalogoAppBar({Key? key, required this.carrinho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: CatalogoAppBar');

    return AppBar(
      title: const Text('Catalogo'),
      actions: [
        IconButton(
          icon: Badge(
            label: Text(
              '${carrinho.items.length}',
              style: TextStyle(color: Colors.white),
            ),
            child: const Icon(
              Icons.shopping_cart,
            ),
          ),
          onPressed: () => Navigator.pushNamed(context, '/carrinho'),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
