
import 'package:flutter/material.dart';
import 'package:gs_2/pages/result_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final _idadeController = TextEditingController();
  final _pesoController = TextEditingController();
  final _alturaController = TextEditingController();
  var genero;
  var nivelAtividade;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorias diárias'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildAge(),
                const SizedBox(height: 20),
                _buildGender(),
                const SizedBox(height: 20),
                _buildWeight(),
                const SizedBox(height: 20),
                _buildHeight(),
                const SizedBox(height: 20),
                _buildActivityLevel(),
                const SizedBox(height: 20),
                _buildButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildAge() {
    return TextFormField(
      controller: _idadeController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Informe sua idade',
        labelText: 'Idade',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty){
          return 'Informe uma idade';
        }
        final idade = int.tryParse(value);
        if(idade == null){
          return 'Sua idade deve ser inteira';
        }
        if (idade < 0){
          return 'Sua idade não pode ser negativa';
        }
        if (idade > 80){
          return 'Sua idade não pode ser maior que 80 anos';
        }
        return null;
      },
    );
  }

  _buildGender() {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        hintText: 'Informe seu gênero',
        labelText: 'Gênero',
        border: OutlineInputBorder(),
      ),
      items: const [
        DropdownMenuItem(
          value: 'male',
          child: Text('Masculino'),
        ),
        DropdownMenuItem(
          value: 'female',
          child: Text('Feminino'),
        ),
      ],
      validator: (value) {
        if(value == null){
          return 'Selecione um gênero';
        }
        return null;
      },
      onChanged: (value) {genero = value;},
    );
  }

  _buildWeight() {
    return TextFormField(
      controller: _pesoController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Informe seu peso (kg)',
        labelText: 'Peso',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
          if (value == null || value.isEmpty){
          return 'Informe um peso';
        }
        final peso = double.tryParse(value);
        if(peso == null){
          return 'Seu peso deve ser um numero';
        }
        if (peso < 40){
          return 'Seu peso não pode ser menor que 40kg';
        }
        if (peso > 160){
          return 'Seu peso não pode ser maior que 160kg';
        }
        return null;
      },
    );
  }

  _buildHeight() {
    return TextFormField(
      controller: _alturaController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        hintText: 'Informe sua altura (cm)',
        labelText: 'Altura',
        border: OutlineInputBorder(),
      ),
      validator: (value) {
          if (value == null || value.isEmpty){
          return 'Informe uma altura';
        }
        final altura = int.tryParse(value);
        if(altura == null){
          return 'Sua altura deve ser um numero inteiro';
        }
        if (altura < 130){
          return 'Sua altura não pode ser menor que 130cm';
        }
        if (altura > 230){
          return 'Sua altura não pode ser maior que 230cm';
        }
        return null;
      },
    );
  }

  _buildActivityLevel() {
    return DropdownButtonFormField(
      decoration: const InputDecoration(
        hintText: 'Informe seu nível de atividade física',
        labelText: 'Nível de atividade',
        border: OutlineInputBorder(),
      ),
      items: const [
        DropdownMenuItem(
          value: 'level_1',
          child: Text('Sedentário: pouco ou nenhum exercício'),
        ),
        DropdownMenuItem(
          value: 'level_2',
          child: Text('Exercício 1-3 vezes/semana'),
        ),
        DropdownMenuItem(
          value: 'level_3',
          child: Text('Exercício 4-5 vezes/semana'),
        ),
        DropdownMenuItem(
          value: 'level_4',
          child: Text('Exercício diário ou exercício intenso 3-4 vezes/semana'),
        ),
        DropdownMenuItem(
          value: 'level_5',
          child: Text('Exercício intenso 6-7 vezes/semana'),
        ),
        DropdownMenuItem(
          value: 'level_6',
          child:
              Text('Exercício muito intenso diariamente, ou trabalho físico'),
        ),
      ],
      validator: (value) {
        if(value == null){
          return 'Selecione um nivel de atividade física';
        }
        return null;
      },
      onChanged: (value) {nivelAtividade = value;},
    );
  }

  SizedBox _buildButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            'Calcular',
            style: TextStyle(fontSize: 20),
          ),
        ),
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            Navigator.push(context, MaterialPageRoute(builder: ((context) =>
             ResultPage(idade: _idadeController.text, peso: _pesoController.text, altura: _alturaController.text,
              genero: genero, nivelAtividade: nivelAtividade,))));
          }
        },
      ),
    );
  }
}
