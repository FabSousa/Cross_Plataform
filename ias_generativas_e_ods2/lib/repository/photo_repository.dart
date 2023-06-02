import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/enum/culturas.dart';
import 'package:ias_generativas_e_ods2/enum/nivel_de_agua.dart';
import 'package:ias_generativas_e_ods2/enum/nutrientes.dart';
import 'package:ias_generativas_e_ods2/enum/pragas_doencas.dart';
import 'package:ias_generativas_e_ods2/models/photo_model.dart';

class PhotoRepository {
  List<PhotoModel> findAll() {
    return [
      PhotoModel(
        id: 195515435616,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.arroz,
        nivelDeAgua: NivelDeAgua.medio,
        data: DateTime.utc(2023, 05, 30),
      ),
      PhotoModel(
        id: 157894458789,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.milho,
        nivelDeAgua: NivelDeAgua.excessivo,
        data: DateTime.utc(2023, 05, 28),
        deficienciaNutrientes: [
          Nutrientes.calcio,
          Nutrientes.enxofre,
          Nutrientes.fosforo
        ],
        pragasDoencas: [
          PragasDoencas.bacterias,
          PragasDoencas.ervasDaninhas,
          PragasDoencas.fungos,
          PragasDoencas.lagartas,
          PragasDoencas.virus,
        ],
      ),
      PhotoModel(
        id: 195515435616,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.arroz,
        nivelDeAgua: NivelDeAgua.excessivo,
        data: DateTime.utc(2023, 05, 15),
      ),
      PhotoModel(
        id: 195515435616,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.arroz,
        nivelDeAgua: NivelDeAgua.critico,
        data: DateTime.utc(2023, 05, 20),
      ),
      PhotoModel(
        id: 195515435616,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.arroz,
        nivelDeAgua: NivelDeAgua.medio,
        data: DateTime.utc(2023, 05, 10),
      ),
      PhotoModel(
        id: 195515435616,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.arroz,
        nivelDeAgua: NivelDeAgua.medio,
        data: DateTime.utc(2023, 05, 31),
      ),
    ];
  }
}
