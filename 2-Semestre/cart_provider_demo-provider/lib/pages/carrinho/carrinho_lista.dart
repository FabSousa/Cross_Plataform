import 'package:flutter/material.dart';

class CarrinhoLista extends StatelessWidget {
  const CarrinhoLista({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: CarrinhoLista');

    return ListView.builder(
      itemCount: 0,
      itemBuilder: (context, index) => ListTile(
        leading: Image(
          image: AssetImage(
            '',
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.remove_circle_outline,
            color: Colors.red,
          ),
          onPressed: () {},
        ),
        title: Text(
          'nome',
        ),
        subtitle: Text(
          'R\$',
        ),
      ),
    );
  }
}
