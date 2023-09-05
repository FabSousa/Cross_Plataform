import 'package:expense_tracker/models/tipo_transacao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

class TransacaoCadastro extends StatefulWidget {
  const TransacaoCadastro({super.key});

  @override
  State<TransacaoCadastro> createState() => _TransacaoCadastroState();
}

class _TransacaoCadastroState extends State<TransacaoCadastro> {
  final key = GlobalKey<FormState>();
  final descricaoController = TextEditingController();
  final valorController = MoneyMaskedTextController();
  final dataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Transação"),
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              _buildDescricao(),
              const SizedBox(
                height: 20,
              ),
              _buildValor(),
              const SizedBox(
                height: 20,
              ),
              _buildTipoTransacao(),
              const SizedBox(
                height: 20,
              ),
              _buildData(),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: _buildButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _buildDescricao() {
    return TextFormField(
      controller: descricaoController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Descrição obrigatória";
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text("Descrição"),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.text_outline),
      ),
    );
  }

  TextFormField _buildValor() {
    return TextFormField(
      controller: valorController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Valor origatório";
        }
        return null;
      },
      decoration: const InputDecoration(
        label: Text("Valor"),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.cash_outline),
      ),
    );
  }

  DropdownMenu<TipoTransacao> _buildTipoTransacao() {
    return DropdownMenu<TipoTransacao>(
      initialSelection: TipoTransacao.receita,
      width: MediaQuery.of(context).size.width - 16,
      dropdownMenuEntries: const [
      DropdownMenuEntry(value: TipoTransacao.despesa, label: "Despesa"),
      DropdownMenuEntry(value: TipoTransacao.receita, label: "Receira"),
    ]);
  }

  TextFormField _buildData() {
    return TextFormField(
      keyboardType: TextInputType.none,
      controller: dataController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Campo obrigatório";
        }
        return null;
      },
      onTap: () async {
        DateTime? dataSelecionada = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (dataSelecionada != null) {
          dataController.text =
              DateFormat("dd/MM/yyyy").format(dataSelecionada);
        }
      },
      decoration: const InputDecoration(
        label: Text("Data"),
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.calendar_clear_outline),
      ),
    );
  }

  ElevatedButton _buildButton() {
    return ElevatedButton(
      onPressed: () {
        final valid = key.currentState!.validate();
        if (valid) {
          print(descricaoController.text);
        }
      },
      child: const Text("Cadastrar transação"),
    );
  }
}
