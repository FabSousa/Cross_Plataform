import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/components/drone_card.dart';
import 'package:ias_generativas_e_ods2/components/photo_card.dart';
import 'package:ias_generativas_e_ods2/enum/nivel_de_agua.dart';
import 'package:ias_generativas_e_ods2/models/drone_model.dart';
import 'package:ias_generativas_e_ods2/models/photo_model.dart';
import 'package:ias_generativas_e_ods2/repository/drone_repository.dart';
import 'package:ias_generativas_e_ods2/repository/photo_repository.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  static const routeName = "/dashboard";

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    List<DroneModel> drones = DroneRepository().findAll();
    List<PhotoModel> photosWithWarnings = _photosWithWarnings();
    List<PhotoCard> photoCards = List.generate(
      photosWithWarnings.length,
      (index) {
        List<PhotoModel> photos = photosWithWarnings;
        return PhotoCard(photo: photos[index]);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const Text(
              "Bem vindo(a) de volta!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Dones operantes",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 200,
            width: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: drones.length,
              itemBuilder: (context, index) => Dronecard(drone: drones[index]),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, bottom: 20),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Plantações que precisam de sua atenção",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 150,
            width: 400,
            child: photosWithWarnings.isEmpty
                ? const Center(
                    child: Text(
                      "Tudo em ordem!",
                      style: TextStyle(fontSize: 40),
                    ),
                  )
                : GridView.count(
                    scrollDirection: Axis.horizontal,
                    crossAxisCount: 1,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1,
                    children: photoCards,
                  ),
          ),
        ],
      ),
    );
  }

  List<PhotoModel> _photosWithWarnings() {
    List<PhotoModel> photos = PhotoRepository().findAll();
    List<PhotoModel> list = List.empty(growable: true);

    for (var photo in photos) {
      bool hasWatherLevelWarning = photo.nivelDeAgua == NivelDeAgua.critico ||
          photo.nivelDeAgua == NivelDeAgua.excessivo;

      bool hasDeficienciaNutrientes = photo.deficienciaNutrientes != null &&
          photo.deficienciaNutrientes!.isNotEmpty;

      bool haspragasDoencas =
          photo.pragasDoencas != null && photo.pragasDoencas!.isNotEmpty;

      if (hasWatherLevelWarning ||
          hasDeficienciaNutrientes ||
          haspragasDoencas) {
        list.add(photo);
      }
    }

    return list;
  }
}
