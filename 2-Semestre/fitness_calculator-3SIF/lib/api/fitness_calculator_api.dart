import 'dart:convert';

import '../models/daily_calorie.dart';
import 'package:http/http.dart' as http;

class FitnessCalculatorApi {
  final String baseUrl = 'https://fitness-calculator.p.rapidapi.com/';
  final String key = 'c826fd375cmsh81e600993822257p19a5a6jsn01fb2b84fc38';
  final String host = 'fitness-calculator.p.rapidapi.com';

  //6 criem o metodo abaixo para fazer a requisição e retornar um DailyCalorie
  Future<DailyCalorie?> getDailyCalories(
      {required String  idade,
      required String  peso,
      required String genero,
      required String altura,
      required String nivelAtividade}) async {
    final url =
        '${baseUrl}dailycalorie?age=$idade&gender=$genero&weight=$peso&height=$altura&activitylevel=$nivelAtividade';
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'X-RapidAPI-Key': key,
        'X-RapidAPI-Host': host
      },
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      var calorias = DailyCalorie.fromJson(json['data']);
      return calorias;
    } else {
      return null;
    }
  }
}
