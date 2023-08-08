import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/enum/nivel_de_agua.dart';
import 'package:ias_generativas_e_ods2/models/photo_model.dart';

class RecomendationsPage extends StatelessWidget {
  const RecomendationsPage({super.key});

  static const routeName = "/recomendations";

  @override
  Widget build(BuildContext context) {
    final photo = ModalRoute.of(context)!.settings.arguments as PhotoModel;
    const backgroundColor = Colors.green;
    const textStyle = TextStyle(color: Colors.white, fontSize: 20);

    final aguaRecomendation = _getAguaRecomendation(photo);
    var nutrientesRecomendation = _getNutrientesRecomendation(photo);
    var pragasRecomendation = _getpragasRecomendation(photo);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Recomendações"),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: photo.image.width,
            child: photo.image,
          ),
          Container(
            color: backgroundColor,
            child: ListTile(
              title: Row(
                children: [
                  const Text(
                    "ID: ",
                    style: textStyle,
                  ),
                  Text(
                    photo.id.toString(),
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: backgroundColor,
            child: ListTile(
              title: Text(
                aguaRecomendation,
                style: textStyle,
              ),
            ),
          ),
          Container(
            color: backgroundColor,
            child: ListTile(
              title: Text(
                nutrientesRecomendation,
                style: textStyle,
              ),
            ),
          ),
          Container(
            color: backgroundColor,
            child: ListTile(
              title: Text(
                pragasRecomendation,
                style: textStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getAguaRecomendation(PhotoModel photo) {
    if (photo.nivelDeAgua == NivelDeAgua.critico) {
      return "Aumentar a irrigação urgentemente";
    }

    if (photo.nivelDeAgua == NivelDeAgua.baixo) {
      return "Aumentar a irrigação";
    }

    if (photo.nivelDeAgua == NivelDeAgua.alto) {
      return "Aumentar a irrigação";
    }

    if (photo.nivelDeAgua == NivelDeAgua.excessivo) {
      return "Diminuir a irrigação urgentemente";
    }

    return "Irrigação perfeita";
  }

  String _getNutrientesRecomendation(PhotoModel photo) {
    if (photo.deficienciaNutrientes == null ||
        photo.deficienciaNutrientes!.isEmpty) {
      return "Todos nutrientes em ordem";
    }

    var nutrients = "";

    for (var element in photo.deficienciaNutrientes!) {
      nutrients += "${element.name}, ";
    }

    return "Nutrientes em falta: $nutrients";
  }

  String _getpragasRecomendation(PhotoModel photo) {
    if (photo.pragasDoencas == null || photo.pragasDoencas!.isEmpty) {
      return "Sem pragas e doenças";
    }
    var pragas = "";

    for (var element in photo.pragasDoencas!) {
      pragas += "${element.name}, ";
    }

    return "Pragras e doenças presentes: $pragas";
  }
}
