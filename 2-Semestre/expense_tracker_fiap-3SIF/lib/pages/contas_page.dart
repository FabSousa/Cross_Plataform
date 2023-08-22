import 'package:expense_tracker/components/conta_item.dart';
import 'package:expense_tracker/models/conta.dart';
import 'package:flutter/material.dart';

import '../repository/contas_repositrory.dart';

class ContasPage extends StatefulWidget {
  const ContasPage({super.key});

  @override
  State<ContasPage> createState() => _ContasPageState();
}

class _ContasPageState extends State<ContasPage> {
  final contas = ContasRepository().listarContas();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: contas.length,
      itemBuilder: (context, index) {
        final conta = contas[index];
        return ContaItem(conta: conta);
      },
      separatorBuilder: (context, index) => const Divider(),
    );
  }
}
