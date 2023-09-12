// import 2
import 'package:expense_tracker/repository/auth_repository.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  var _ocultarSenha = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.2),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildBemVindo(),
                    const SizedBox(height: 20),
                    _buildEmail(),
                    const SizedBox(height: 20),
                    _buildSenha(),
                    const SizedBox(height: 10),
                    _buildButton(),
                    const SizedBox(height: 10),
                    _buildRegistrar(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Text _buildBemVindo() {
    return const Text(
      "Bem Vindo!",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
    );
  }

  TextFormField _buildEmail() {
    return TextFormField(
      controller: _emailController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'O campo email é obrigatório';
        }

        if (!validarEmail(value)) {
          return 'Email inválido';
        }

        return null;
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Digite seu e-mail",
        prefixIcon: Icon(Icons.email_outlined),
      ),
    );
  }

  TextFormField _buildSenha() {
    return TextFormField(
      controller: _senhaController,
      validator: (value) {
        if (value == null || value.length < 5) {
          return 'A senha deve conter no mínino 5 caracteres';
        }
        if (value.length > 12) {
          return 'A senha não pode ter mais que 12 caracteres';
        }
        return null;
      },
      obscureText: _ocultarSenha,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: "Digite sua senha",
        prefixIcon: const Icon(Icons.lock_outline_rounded),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _ocultarSenha = !_ocultarSenha;
            });
          },
          child: _ocultarSenha
              ? const Icon(Icons.visibility_outlined)
              : const Icon(Icons.visibility_off_outlined),
        ),
      ),
    );
    // Icone para ocultar a senha visibility_off_outlined
  }

  Widget _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          final isValid = _formKey.currentState!.validate();

          if (isValid) {
            onTapBtnSignUp(_emailController.text, _senhaController.text);
          }
        },
        child: const Text('Login'),
      ),
    );
  }

  Widget _buildRegistrar() {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, "/registrar");
      },
      child: RichText(
          text: TextSpan(children: <InlineSpan>[
            TextSpan(
              text: "Não tem uma conta?",
              style: TextStyle(
                  color: Colors.blueGrey.shade300,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            TextSpan(
              text: ' ',
              style: TextStyle(
                  color: Colors.indigo.shade300,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: "Registrar-se",
              style: TextStyle(
                  color: Colors.lightBlue.shade300,
                  fontSize: 12,
                  fontWeight: FontWeight.w700),
            )
          ]),
          textAlign: TextAlign.center),
    );
  }

  bool validarEmail(String email) {
    const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
    final regExp = RegExp(pattern);
    return regExp.hasMatch(email);
  }

  void _exibirMensagem(String mensagem) {
    final snackbar = SnackBar(content: Text(mensagem));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void onTapBtnSignUp(String email, String senha) {
    final auth = AuthRepository().login(email, senha);
    auth.then((value) {
      if (value) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _exibirMensagem('Email ou senha incorretos');
      }
    }).catchError((value) {
      _exibirMensagem('Erro ao logar, tente novamente mais tarde');
    });
  }
}
