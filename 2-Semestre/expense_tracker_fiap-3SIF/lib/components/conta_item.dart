import 'package:expense_tracker/models/banco.dart';
import 'package:expense_tracker/models/conta.dart';
import 'package:flutter/material.dart';

class ContaItem extends StatelessWidget {
  final Conta conta;
  const ContaItem({super.key, required this.conta});

  @override
  Widget build(BuildContext context) {
    final logo = bancosMap[conta.bancoId]?.logo;
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: Image.asset('images/$logo').image,
      ),
      title: Text(conta.id),
      subtitle: Text(conta.descricao),
      trailing: Text(
        conta.tipoConta.name,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
      ),
    );
  }
}
