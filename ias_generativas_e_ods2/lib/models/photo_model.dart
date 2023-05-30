import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/enum/culturas.dart';
import 'package:ias_generativas_e_ods2/enum/nivel_de_agua.dart';
import 'package:ias_generativas_e_ods2/enum/nutrientes.dart';
import 'package:ias_generativas_e_ods2/enum/pragas_doencas.dart';

class PhotoModel {
  int id;
  Image image;
  Culturas cultura;
  List<Nutrientes>? deficienciaNutrientes;
  List<PragasDoencas>? pragasDoencas;
  NivelDeAgua nivelDeAgua;

  PhotoModel({
    required this.id,
    required this.image,
    required this.cultura,
    this.deficienciaNutrientes,
    this.pragasDoencas,
    required this.nivelDeAgua,
  });
}
