// ReesultPage é a tela que exibe o resultado do calculo de calorias diárias6
import 'package:flutter/material.dart';
import 'package:gs_2/api/fitness_calculator_api.dart';
import 'package:gs_2/models/daily_calorie.dart';

class ResultPage extends StatefulWidget {
  final String idade;
  final String peso;
  final String genero;
  final String altura;
  final String nivelAtividade;

  const ResultPage({
    super.key,
    required this.idade,
    required this.genero,
    required this.peso,
    required this.altura,
    required this.nivelAtividade,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late Future<DailyCalorie?> futureCalorias;

  @override
  void initState() {
    super.initState();
    futureCalorias = FitnessCalculatorApi().getDailyCalories(idade: widget.idade, peso: widget.peso, genero: widget.genero,
     altura: widget.altura, nivelAtividade: widget.nivelAtividade);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorias diárias'),
      ),
      // Remove o Widgt de center e add o FutureBuilder para exibir o resultado
      body: FutureBuilder(
        future: futureCalorias,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Erro"),
              );
            } else {
              final DailyCalorie? calorias = snapshot.data;
              return _buildResult(calorias!);
            }
          }
          return Container();
        },
      ),
    );
  }

  // Utilize o metodo abaixo para criar o corpo da tela de resultado
  _buildResult(DailyCalorie calorie) {
    return ListView(
      children: [
        ListTile(
          title: const Text('Metabolismo basal'),
          subtitle: Text(
            '${calorie.bMR}',
          ),
        ),
        ListTile(
          title: const Text('Manter o peso'),
          subtitle: Text(
            '${calorie.goals?.maintainWeight}',
          ),
        ),
        ListTile(
          title: Text(
              'Perda leve de peso ${calorie.goals?.mildWeightLoss?.lossWeight}'),
          subtitle: Text(
            '${calorie.goals?.mildWeightLoss?.calory}',
          ),
        ),
        ListTile(
          title: Text('Perda de peso ${calorie.goals?.weightLoss?.lossWeight}'),
          subtitle: Text(
            '${calorie.goals?.weightLoss?.calory}',
          ),
        ),
        ListTile(
          title: Text(
              'Perda extrema de peso ${calorie.goals?.extremeWeightLoss?.lossWeight}'),
          subtitle: Text(
            '${calorie.goals?.extremeWeightLoss?.calory}',
          ),
        ),
        ListTile(
          title: Text(
              'Ganho leve de peso ${calorie.goals?.mildWeightGain?.gainWeight}'),
          subtitle: Text(
            '${calorie.goals?.mildWeightGain?.calory}',
          ),
        ),
        ListTile(
          title: Text('Ganho de peso ${calorie.goals?.weightGain?.gainWeight}'),
          subtitle: Text(
            '${calorie.goals?.weightGain?.calory}',
          ),
        ),
        ListTile(
          title: Text(
              'Ganho extremo de peso ${calorie.goals?.extremeWeightGain?.gainWeight}'),
          subtitle: Text(
            '${calorie.goals?.extremeWeightGain?.calory}',
          ),
        ),
      ],
    );
  }
}
