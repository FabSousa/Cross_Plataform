import 'package:expense_tracker/components/categoria_select.dart';
import 'package:expense_tracker/models/categoria.dart';
import 'package:expense_tracker/models/tipo_transacao.dart';
import 'package:expense_tracker/pages/categorias_select_page.dart';
import 'package:expense_tracker/pages/contas_select_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';

import '../components/conta_select.dart';
import '../models/conta.dart';

class TransacaoCadastroPage extends StatefulWidget {
  const TransacaoCadastroPage({super.key});

  @override
  State<TransacaoCadastroPage> createState() => _TransacaoCadastroPageState();
}

class _TransacaoCadastroPageState extends State<TransacaoCadastroPage> {
  final descricaoController = TextEditingController();
  final valorController = MoneyMaskedTextController(
      decimalSeparator: ',', thousandSeparator: '.', leftSymbol: 'R\$');

  final dataController = TextEditingController();

  final detalhesController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  TipoTransacao tipoTransacaoSelecionada = TipoTransacao.receita;

  Categoria? categoriaSelecionada;
  Conta? contaSelecionada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Transação'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDescricao(),
                const SizedBox(height: 30),
                _buildTipoTransacao(),
                const SizedBox(height: 30),
                _buildCategoriaSelect(),
                const SizedBox(height: 30),
                _buildContaSelect(),
                const SizedBox(height: 30),
                _buildValor(),
                const SizedBox(height: 30),
                _buildData(),
                const SizedBox(height: 30),
                _buildObservacao(),
                const SizedBox(height: 30),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CategoriaSelect _buildCategoriaSelect() {
    return CategoriaSelect(
      categoria: categoriaSelecionada,
      onTap: () async {
        final result = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CategoriesSelectPage(
              tipoTransacao: tipoTransacaoSelecionada,
            ),
          ),
        ) as Categoria?;

        if (result != null) {
          setState(() {
            categoriaSelecionada = result;
          });
        }
      },
    );
  }

  ContaSelect _buildContaSelect() {
    return ContaSelect(
      conta: contaSelecionada,
      onTap: () async {
        final result = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const ContasSelectPage(),
          ),
        ) as Conta?;

        if (result != null) {
          setState(() {
            contaSelecionada = result;
          });
        }
      },
    );
  }

  TextFormField _buildDescricao() {
    return TextFormField(
      controller: descricaoController,
      decoration: const InputDecoration(
        hintText: 'Informe a descrição',
        labelText: 'Descrição',
        prefixIcon: Icon(Ionicons.text_outline),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe uma Descrição';
        }
        if (value.length < 5 || value.length > 30) {
          return 'A Descrição deve entre 5 e 30 caracteres';
        }
        return null;
      },
    );
  }

  DropdownMenu<TipoTransacao> _buildTipoTransacao() {
    return DropdownMenu<TipoTransacao>(
      width: MediaQuery.of(context).size.width - 16,
      initialSelection: tipoTransacaoSelecionada,
      label: const Text('Tipo de Transação'),
      dropdownMenuEntries: const [
        DropdownMenuEntry(
          value: TipoTransacao.receita,
          label: "Receita",
        ),
        DropdownMenuEntry(
          value: TipoTransacao.despesa,
          label: "Despesa",
        ),
      ],
      onSelected: (value) {
        tipoTransacaoSelecionada = value!;
        setState(() {
          categoriaSelecionada = null;
        });
      },
    );
  }

  TextFormField _buildValor() {
    return TextFormField(
      controller: valorController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Informe o valor',
        labelText: 'Valor',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.cash_outline),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe um Valor';
        }
        final valor = NumberFormat.currency(locale: 'pt_BR')
            .parse(valorController.text.replaceAll('R\$', ''));
        if (valor <= 0) {
          return 'Informe um valor maior que zero';
        }

        return null;
      },
    );
  }

  SizedBox _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            final descricao = descricaoController.text;
            final valor = NumberFormat.currency(locale: 'pt_BR')
                .parse(valorController.text.replaceAll('R\$', ''));

            final detalhes = detalhesController.text;

            print(descricao);
            print(valor);
            print(detalhes);
            print(tipoTransacaoSelecionada);
          }
        },
        child: const Text('Cadastrar'),
      ),
    );
  }

  TextFormField _buildObservacao() {
    return TextFormField(
      controller: detalhesController,
      decoration: const InputDecoration(
        hintText: 'Informe alguma observação',
        labelText: 'Observação',
        border: OutlineInputBorder(),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 2,
    );
  }

  TextFormField _buildData() {
    return TextFormField(
      controller: dataController,
      keyboardType: TextInputType.none,
      decoration: const InputDecoration(
        hintText: 'Informe uma Data',
        labelText: 'Data',
        border: OutlineInputBorder(),
        prefixIcon: Icon(Ionicons.calendar_outline),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe uma Data';
        }

        try {
          DateFormat('dd/MM/yyyy').parse(value);
        } on FormatException {
          return 'Formato de data inválida';
        }

        return null;
      },
      onTap: () async {
        //FocusScope.of(context).requestFocus(FocusNode());

        DateTime? dataSelecionada = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
        );

        if (dataSelecionada != null) {
          dataController.text =
              DateFormat('dd/MM/yyyy').format(dataSelecionada);
        }
      },
    );
  }
}
