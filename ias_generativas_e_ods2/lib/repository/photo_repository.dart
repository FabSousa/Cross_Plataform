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
        image: Image.asset(
          "assets/images/milho/milho1.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.milho,
        nivelDeAgua: NivelDeAgua.critico,
        data: DateTime.utc(2023, 01, 29),
      ),
      PhotoModel(
        id: 157894458789,
        image: Image.asset(
          "assets/images/milho/milho2.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.milho,
        nivelDeAgua: NivelDeAgua.alto,
        data: DateTime.utc(2023, 06, 28),
        deficienciaNutrientes: [
          Nutrientes.calcio,
          Nutrientes.enxofre,
          Nutrientes.fosforo
        ],
        pragasDoencas: [
          PragasDoencas.bacterias,
          PragasDoencas.fungos,
          PragasDoencas.lagartas,
          PragasDoencas.virus,
        ],
      ),
      PhotoModel(
        id: 198264876562,
        image: Image.asset(
          "assets/images/milho/milho3.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.milho,
        nivelDeAgua: NivelDeAgua.excessivo,
        data: DateTime.utc(2023, 01, 15),
      ),
      PhotoModel(
        id: 185610445846,
        image: Image.asset(
          "assets/images/milho/milho4.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.milho,
        nivelDeAgua: NivelDeAgua.medio,
        data: DateTime.utc(2023, 04, 20),
      ),
      PhotoModel(
        id: 202156498489,
        image: Image.asset(
          "assets/images/milho/milho5.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.milho,
        nivelDeAgua: NivelDeAgua.critico,
        data: DateTime.utc(2023, 05, 15),
      ),
      PhotoModel(
        id: 204834425106,
        image: Image.asset(
          "assets/images/soja/soja1.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.soja,
        nivelDeAgua: NivelDeAgua.baixo,
        data: DateTime.utc(2023, 04, 10),
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
        image: Image.asset(
          "assets/images/soja/soja2.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.soja,
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
        image: Image.asset(
          "assets/images/soja/soja3.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.soja,
        nivelDeAgua: NivelDeAgua.excessivo,
        data: DateTime.utc(2023, 07, 26),
        deficienciaNutrientes: [
          Nutrientes.potassio,
        ],
        pragasDoencas: [
          PragasDoencas.bacterias,
          PragasDoencas.fungos,
          PragasDoencas.virus,
        ],
      ),
      PhotoModel(
        id: 185487897563,
        image: Image.asset(
          "assets/images/soja/soja4.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.soja,
        nivelDeAgua: NivelDeAgua.baixo,
        data: DateTime.utc(2023, 06, 22),
        deficienciaNutrientes: [
          Nutrientes.fosforo,
          Nutrientes.calcio,
          Nutrientes.magnesio
        ],
      ),
      PhotoModel(
        id: 195878456462,
        image: Image.asset(
          "assets/images/soja/soja5.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.soja,
        nivelDeAgua: NivelDeAgua.critico,
        data: DateTime.utc(2023, 05, 28),
      ),
      PhotoModel(
        id: 195878456462,
        image: Image.asset(
          "assets/images/trigo/trigo1.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.trigo,
        nivelDeAgua: NivelDeAgua.alto,
        data: DateTime.utc(2022, 12, 13),
        deficienciaNutrientes: [
          Nutrientes.potassio,
        ],
        pragasDoencas: [
          PragasDoencas.bacterias,
          PragasDoencas.fungos,
          PragasDoencas.lagartas,
          PragasDoencas.virus,
        ],
      ),
      PhotoModel(
        id: 195878456462,
        image: Image.asset(
          "assets/images/trigo/trigo2.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.trigo,
        nivelDeAgua: NivelDeAgua.medio,
        data: DateTime.utc(2023, 02, 07),
        deficienciaNutrientes: [
          Nutrientes.calcio,
          Nutrientes.enxofre,
          Nutrientes.magnesio
        ],
      ),
      PhotoModel(
        id: 195878456462,
        image: Image.asset(
          "assets/images/trigo/trigo3.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.trigo,
        nivelDeAgua: NivelDeAgua.medio,
        data: DateTime.utc(2023, 05, 28),
        pragasDoencas: [
          PragasDoencas.bacterias,
          PragasDoencas.fungos,
          PragasDoencas.virus,
        ],
      ),
      PhotoModel(
        id: 195878456462,
        image: Image.asset(
          "assets/images/trigo/trigo4.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.trigo,
        nivelDeAgua: NivelDeAgua.baixo,
        data: DateTime.utc(2023, 07, 16),
        deficienciaNutrientes: [
          Nutrientes.fosforo,
          Nutrientes.calcio,
          Nutrientes.enxofre,
          Nutrientes.magnesio
        ],
      ),
      PhotoModel(
        id: 195878456462,
        image: Image.asset(
          "assets/images/trigo/trigo5.png",
          fit: BoxFit.cover,
          width: 512,
          height: 512,
        ),
        cultura: Culturas.trigo,
        nivelDeAgua: NivelDeAgua.critico,
        data: DateTime.utc(2022, 11, 11),
      ),
    ];
  }
}
