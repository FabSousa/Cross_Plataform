import 'package:cart_provider_demo/models/carrinho.dart';
import 'package:flutter/material.dart';

class CarrinhoTotal extends StatelessWidget {
  final CarrinhoModel carrinho;
  const CarrinhoTotal({Key? key, required this.carrinho}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: CarrinhoTotal');

    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'R\$${carrinho.totalPrice}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w300),
            ),
            const SizedBox(width: 24),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Buying not supported yet.')));
              },
              //style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text('COMPRAR'),
            ),
          ],
        ),
      ),
    );
  }
}
