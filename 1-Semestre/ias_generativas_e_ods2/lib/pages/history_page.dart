import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/components/history_card.dart';
import 'package:ias_generativas_e_ods2/components/nav_bar.dart';
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

    List<PhotoModel> filtredPhotos = List.empty(growable: true);

    photos.sort(
      (a, b) => b.data.compareTo(a.data),
    );

    for (var photo in photos) {
      if (filters == null) {
        filtredPhotos = photos;
        break;
      }

      bool culturaCheck = filters[Filtros.cultura] == null ||
          filters[Filtros.cultura] == photo.cultura;

      bool aguaCheck = filters[Filtros.agua] == null ||
          filters[Filtros.agua] == photo.nivelDeAgua;

      bool nutrientesCheck = filters[Filtros.nutrientes] == null ||
          photo.deficienciaNutrientes != null &&
              photo.deficienciaNutrientes!
                  .contains(filters[Filtros.nutrientes]);

      bool pragasCheck = filters[Filtros.pragas] == null ||
          photo.pragasDoencas != null &&
              photo.pragasDoencas!.contains(filters[Filtros.pragas]);

      if (culturaCheck && aguaCheck && nutrientesCheck && pragasCheck) {
        filtredPhotos.add(photo);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Histórico"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                FilterPage.routeName,
              );
            },
            icon: const Icon(Icons.filter_alt),
          ),
        ],
      ),
      body: filtredPhotos.isEmpty
          ? const Center(
              child: Text(
                "Nenhum resultado encontrado",
                style: TextStyle(fontSize: 25),
              ),
            )
          : ListView.builder(
              itemCount: filtredPhotos.length,
              itemBuilder: (context, index) =>
                  HistoryCard(photo: filtredPhotos[index]),
            ),
      bottomNavigationBar: const NavBar(index: 2),
    );
  }
}
