import 'package:cart_provider_demo/models/carrinho.dart';
import 'package:cart_provider_demo/pages/carrinho/carrinho_page.dart';
import 'package:cart_provider_demo/pages/catalogo/catalogo_page.dart';
import 'package:flutter/material.dart';

import 'models/catalogo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CarrinhoModel carrinho = CarrinhoModel();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => CatalogoPage(
              carrinho: carrinho,
              onCarrinhoAdd: (item) {
                setState(() {
                  carrinho.add(item);
                });
              },
            ),
        '/carrinho': (context) => CarrinhoPage(
              carrinho: carrinho,
              onCarrinhoRemove: (item) {
                setState(() {
                  carrinho.remove(item);
                });
              },
            ),
      },
    );
  }
}
