import 'package:expense_tracker_fiap/models/categoria.dart';
import 'package:expense_tracker_fiap/models/repository/categoria_repository.dart';
import 'package:expense_tracker_fiap/models/tipo_transacao.dart';
import 'package:flutter/material.dart';

class CategoriasPage extends StatefulWidget {
  const CategoriasPage();

  @override
  State<CategoriasPage> createState() => _CategoriasPageState();
}

class _CategoriasPageState extends State<CategoriasPage> {
  final categorias = CategoriaRepository().obterCategorias();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('categorias'),
      ),
      body: ListView.builder(
          itemCount: categorias.length,
          itemBuilder: (buildContext, index) {
            Categoria categoria = categorias[index];
            return ListTile(
              leading: Icon(categoria.icone),
              iconColor: categoria.cor,
              title: Text(categoria.nome),
              trailing: Text(
                categoria.tipoTransacao.name,
                style: TextStyle(
                    color: categoria.tipoTransacao.name ==
                            TipoTransacao.despesa.name
                        ? Colors.red
                        : Colors.green),
              ),
            );
          }),
    );
  }
}
