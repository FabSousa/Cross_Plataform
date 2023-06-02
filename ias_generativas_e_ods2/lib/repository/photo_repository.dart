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
        cultura: Culturas.milho,
        nivelDeAgua: NivelDeAgua.critico,
        data: DateTime.utc(2023, 05, 30),
      ),
      PhotoModel(
        id: 157894458789,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.milho,
        nivelDeAgua: NivelDeAgua.alto,
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
        id: 198264876562,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.arroz,
        nivelDeAgua: NivelDeAgua.excessivo,
        data: DateTime.utc(2023, 05, 15),
      ),
      PhotoModel(
        id: 185610445846,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.arroz,
        nivelDeAgua: NivelDeAgua.medio,
        data: DateTime.utc(2023, 05, 20),
      ),
      PhotoModel(
        id: 204834425106,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.cafe,
        nivelDeAgua: NivelDeAgua.baixo,
        data: DateTime.utc(2023, 05, 10),
        deficienciaNutrientes: [
          Nutrientes.enxofre,
          Nutrientes.fosforo,
        ],
        pragasDoencas: [
          PragasDoencas.bacterias,
          PragasDoencas.fungos,
        ],
      ),
      PhotoModel(
        id: 205456474872,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.cafe,
        nivelDeAgua: NivelDeAgua.alto,
        data: DateTime.utc(2023, 05, 14),
        deficienciaNutrientes: [
          Nutrientes.potassio,
        ],
        pragasDoencas: [
          PragasDoencas.lagartas,
        ],
      ),
      PhotoModel(
        id: 175579585215,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.feijao,
        nivelDeAgua: NivelDeAgua.excessivo,
        data: DateTime.utc(2023, 05, 26),
        pragasDoencas: [
          PragasDoencas.bacterias,
          PragasDoencas.ervasDaninhas,
          PragasDoencas.virus,
        ],
      ),
      PhotoModel(
        id: 185487897563,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.feijao,
        nivelDeAgua: NivelDeAgua.baixo,
        data: DateTime.utc(2023, 05, 22),
        deficienciaNutrientes: [
          Nutrientes.fosforo,
          Nutrientes.calcio,
          Nutrientes.enxofre,
          Nutrientes.magnesio
        ],
      ),
      PhotoModel(
        id: 195878456462,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.soja,
        nivelDeAgua: NivelDeAgua.medio,
        data: DateTime.utc(2023, 05, 28),
      ),
      PhotoModel(
        id: 202156498489,
        image: Image.network("https://picsum.photos/512/512"),
        cultura: Culturas.soja,
        nivelDeAgua: NivelDeAgua.critico,
        data: DateTime.utc(2023, 05, 15),
      ),
    ];
  }
}
