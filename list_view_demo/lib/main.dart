import 'package:flutter/material.dart';
import 'package:list_view_demo/basic_list_view.dart';
import 'package:list_view_demo/buider_list_view.dart';
import 'package:list_view_demo/lista_contatos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListaContatos(),
    );
  }
}
