import 'package:expense_tracker/repository/transacoes_repository.dart';
import 'package:flutter/material.dart';

import '../components/transacao_item.dart';
import '../models/tipo_transacao.dart';
import '../models/transacao.dart';

class TransacoesPage extends StatefulWidget {
  const TransacoesPage({super.key});

  @override
  State<TransacoesPage> createState() => _TransacoesPageState();
}

class _TransacoesPageState extends State<TransacoesPage> {
  final transacoesRepo = TransacoesReepository();
  late Future<List<Transacao>> futureTransacoes;

  @override
  void initState() {
    futureTransacoes = transacoesRepo.listarTransacoes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transações'),
        actions: [
          // create a filter menu action
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: const Text('Todas'),
                  onTap: () {
                    setState(() {
                      futureTransacoes = transacoesRepo.listarTransacoes();
                    });
                  },
                ),
                PopupMenuItem(
                  child: const Text('Receitas'),
                  onTap: () {
                    setState(() {
                      futureTransacoes = transacoesRepo.listarTransacoes(
                          tipoTransacao: TipoTransacao.receita);
                    });
                  },
                ),
                PopupMenuItem(
                  child: const Text('Despesas'),
                  onTap: () {
                    setState(() {
                      futureTransacoes = transacoesRepo.listarTransacoes(
                          tipoTransacao: TipoTransacao.despesa);
                    });
                  },
                ),
              ];
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Transacao>>(
        future: futureTransacoes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Erro ao carregar contas"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Nenhuma conta encontrada"),
            );
          } else {
            final transacoes = snapshot.data!;
            return ListView.separated(
              itemCount: transacoes.length,
              itemBuilder: (context, index) {
                final transacao = transacoes[index];
                return TransacaoItem(
                  transacao: transacao,
                  onTap: () {
                    Navigator.pushNamed(context, '/transacao-detalhes',
                        arguments: transacao);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "transacao-cadastro",
        onPressed: () {
          Navigator.pushNamed(context, '/transacao-cadastro');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
