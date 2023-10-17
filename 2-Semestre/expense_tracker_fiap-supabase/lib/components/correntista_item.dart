import 'package:expense_tracker/models/correntista.dart';
import 'package:flutter/material.dart';

class CorrentistaItem extends StatelessWidget {
  final Correntista correntista;
  const CorrentistaItem({super.key, required this.correntista});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(correntista.nome),
      subtitle: Text(correntista.email),
      trailing: Text(correntista.cpf),
    );
  }
}
