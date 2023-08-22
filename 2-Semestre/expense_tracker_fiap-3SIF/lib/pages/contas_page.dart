import 'package:expense_tracker/components/conta_item.dart';
import 'package:expense_tracker/repository/conta_repository.dart';
import 'package:flutter/material.dart';

class ContasPage extends StatefulWidget {
  const ContasPage({super.key});

  @override
  State<ContasPage> createState() => _ContasPageState();
}

class _ContasPageState extends State<ContasPage> {
  final contas = ContaRepository().getContas();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
          title: const Text('Contas'),
        ),body: ListView.separated(
          itemCount: contas.length,
          itemBuilder: (context, index) {
            final conta = contas[index];
            return ContaItem(conta: conta);
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ));
  }
}
