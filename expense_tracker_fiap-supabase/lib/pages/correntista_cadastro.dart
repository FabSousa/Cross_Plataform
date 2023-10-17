import 'package:expense_tracker/models/correntista.dart';
import 'package:expense_tracker/repository/correntista_repository.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CorrentistaCadastro extends StatefulWidget {
  final int contaId;
  final Correntista? correntistaUpdate;
  const CorrentistaCadastro(
      {super.key, required this.contaId, this.correntistaUpdate});

  @override
  State<CorrentistaCadastro> createState() => _CorrentistaCadastroState();
}

class _CorrentistaCadastroState extends State<CorrentistaCadastro> {
  late final int contaId;
  late final Correntista? correntistaUpdate;
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final cpfController = TextEditingController();
  final celularController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    contaId = widget.contaId;
    correntistaUpdate = widget.correntistaUpdate;

    if (correntistaUpdate != null) {
      nomeController.text = correntistaUpdate!.nome;
      emailController.text = correntistaUpdate!.email;
      cpfController.text = correntistaUpdate!.cpf;
      if (correntistaUpdate?.celular != null) {
        celularController.text = correntistaUpdate!.celular!;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: correntistaUpdate == null
            ? const Text('Cadastro de Correntista')
            : const Text('Update de Correntista'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildNome(),
                const SizedBox(height: 30),
                _buildEmail(),
                const SizedBox(height: 30),
                _buildCpf(),
                const SizedBox(height: 30),
                _buildCelular(),
                const SizedBox(height: 30),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildNome() {
    return TextFormField(
      controller: nomeController,
      decoration: const InputDecoration(
        hintText: 'Informe o nome',
        labelText: 'Nome',
        prefixIcon: Icon(Ionicons.text_outline),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe um Nome';
        }
        return null;
      },
    );
  }

  TextFormField _buildEmail() {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
        hintText: 'Informe o email',
        labelText: 'Email',
        prefixIcon: Icon(Ionicons.mail_outline),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe um Email';
        } else if (!validarEmail(value)) {
          return "Por favor, digite um e-mail válido";
        }
        return null;
      },
    );
  }

  bool validarEmail(String email) {
    const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  TextFormField _buildCpf() {
    return TextFormField(
      controller: cpfController,
      decoration: const InputDecoration(
        hintText: 'Informe o CPF',
        labelText: 'CPF',
        prefixIcon: Icon(Ionicons.text_outline),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Informe um CPF';
        } else if (value.length != 11) {
          return 'CPF inválido';
        }
        return null;
      },
    );
  }

  TextFormField _buildCelular() {
    return TextFormField(
      controller: celularController,
      decoration: const InputDecoration(
        hintText: 'Informe o celular',
        labelText: 'Celular',
        prefixIcon: Icon(Ionicons.cellular_outline),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        return null;
      },
    );
  }

  SizedBox _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            final nome = nomeController.text;
            final email = emailController.text;
            final cpf = cpfController.text;
            final celular = celularController.text;

            final correntista = Correntista(
              id: 0,
              contaId: contaId,
              nome: nome,
              email: email,
              cpf: cpf,
              celular: celular,
            );
            if (widget.correntistaUpdate == null) {
              await _cadastrarCorrentista(correntista);
            } else {
              correntista.id = widget.correntistaUpdate!.id;
              await _alterarCorrentista(correntista);
            }
          }
        },
        child: const Text('Cadastrar'),
      ),
    );
  }

  Future<void> _cadastrarCorrentista(Correntista correntista) async {
    final scaffold = ScaffoldMessenger.of(context);
    await CorrentistaRepository().cadastrarCorrentista(correntista).then((_) {
      scaffold.showSnackBar(const SnackBar(
        content: Text(
          'Correntista cadastrado com sucesso',
        ),
      ));
      Navigator.popAndPushNamed(context, '/contas');
    }).catchError((error) {
      scaffold.showSnackBar(const SnackBar(
        content: Text(
          'Erro ao cadastrar correntista',
        ),
      ));

      Navigator.popAndPushNamed(context, '/contas');
    });
  }

  Future<void> _alterarCorrentista(Correntista correntista) async {
    final scaffold = ScaffoldMessenger.of(context);
    await CorrentistaRepository().alterarCorrentista(correntista).then((_) {
      // Mensagem de Sucesso
      scaffold.showSnackBar(const SnackBar(
        content: Text(
          'Correntista alterado com sucesso',
        ),
      ));
      Navigator.popAndPushNamed(context, '/contas');
    }).catchError((error) {
      // Mensagem de Erro
      scaffold.showSnackBar(const SnackBar(
        content: Text(
          'Erro ao alterar correntista',
        ),
      ));

      Navigator.popAndPushNamed(context, '/contas');
    });
  }
}
