import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/components/history_card.dart';
import 'package:ias_generativas_e_ods2/enum/filtros.dart';
import 'package:ias_generativas_e_ods2/models/photo_model.dart';
import 'package:ias_generativas_e_ods2/pages/filter_page.dart';

import '../repository/photo_repository.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  static const routeName = "/history";

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<PhotoModel> photos = PhotoRepository().findAll();

  @override
  Widget build(BuildContext context) {
    final filters =
        ModalRoute.of(context)!.settings.arguments as Map<Filtros, Object?>?;

    photos.sort(
      (a, b) => a.data.compareTo(b.data),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Histórico"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                FilterPage.routeName,
              );
            },
            icon: const Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          PhotoModel photo = photos[index];

          if (filters == null) return HistoryCard(photo: photo);

          bool culturaCheck = filters[Filtros.cultura] == null ||
              filters[Filtros.cultura] == photo.cultura;

          bool aguaCheck = filters[Filtros.agua] == null ||
              filters[Filtros.cultura] == photo.nivelDeAgua;

          bool nutrientesCheck = filters[Filtros.nutrientes] == null ||
              filters[Filtros.cultura] == photo.deficienciaNutrientes;

          bool pragasCheck = filters[Filtros.pragas] == null ||
              filters[Filtros.cultura] == photo.pragasDoencas;

          if (culturaCheck && aguaCheck && nutrientesCheck && pragasCheck) {
            return HistoryCard(photo: photo);
          }
          return null;
        },
      ),
    );
  }
}
