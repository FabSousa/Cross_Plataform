import 'package:expense_tracker/components/correntista_item.dart';
import 'package:expense_tracker/models/correntista.dart';
import 'package:expense_tracker/pages/correntista_cadastro.dart';
import 'package:expense_tracker/repository/correntista_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CorrentistasDetalhe extends StatefulWidget {
  const CorrentistasDetalhe({super.key});

  @override
  State<CorrentistasDetalhe> createState() => _CorrentistasDetalheState();
}

class _CorrentistasDetalheState extends State<CorrentistasDetalhe> {
  @override
  Widget build(BuildContext context) {
    final contaId = ModalRoute.of(context)!.settings.arguments as int;

    var futureCorrentista =
        CorrentistaRepository().listarCorrentistas(contaId: contaId);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Correntistas'),
      ),
      body: FutureBuilder<List<Correntista>>(
        future: futureCorrentista,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Erro ao carregar correntistas"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Nenhum correntista encontrado"),
            );
          } else {
            final correntistas = snapshot.data!;
            return ListView.separated(
              itemCount: correntistas.length,
              itemBuilder: (context, index) {
                final correntista = correntistas[index];
                return Slidable(
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CorrentistaCadastro(
                                contaId: contaId,
                                correntistaUpdate: correntista,
                              ),
                            ),
                          ) as bool?;

                          if (result == true) {
                            setState(
                              () {
                                futureCorrentista = CorrentistaRepository()
                                    .listarCorrentistas();
                              },
                            );
                          }
                        },
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Editar',
                      ),
                      SlidableAction(
                        onPressed: (context) async {
                          await CorrentistaRepository()
                              .excluirCorrentista(correntista.id);

                          setState(() {
                            correntistas.removeAt(index);
                          });
                        },
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Remover',
                      ),
                    ],
                  ),
                  child: CorrentistaItem(
                    correntista: correntista,
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "correntista-cadastro",
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CorrentistaCadastro(
                contaId: contaId,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
