import 'package:expense_tracker/repository/categoria_repository.dart';
import 'package:flutter/material.dart';

import '../components/categoria_Item.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({super.key});

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final categorias = CategoriaRepository().listarCategorias();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categorias'),
        ),
        body: ListView.separated(
          itemCount: categorias.length,
          itemBuilder: (context, index) {
            final categoria = categorias[index];
            return CategoriaItem(categoria: categoria);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ));
  }
}
