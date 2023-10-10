import 'package:cart_provider_demo/models/carrinho.dart';
import 'package:cart_provider_demo/pages/carrinho/carrinho_page.dart';
import 'package:cart_provider_demo/pages/catalogo/catalogo_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CarrinhoModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        '/': (context) => CatalogoPage(),
        '/carrinho': (context) => CarrinhoPage(),
      },
    );
  }
}
