import 'package:expense_tracker/repository/categoria_repository.dart';
import 'package:flutter/material.dart';

import '../components/categoria_Item.dart';
import '../models/categoria.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage({super.key});

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final futureCategorias = CategoriaRepository().listarCategorias();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: FutureBuilder<List<Categoria>>(
          future: futureCategorias,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(child: Text("Erro ao istar as categorias"));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("Nenhuma categoria encontrada"));
            }

            final categorias = snapshot.data!;
            return ListView.separated(
              itemCount: categorias.length,
              itemBuilder: (context, index) {
                final categoria = categorias[index];
                return CategoriaItem(categoria: categoria);
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            );
          }),
    );
  }
}
