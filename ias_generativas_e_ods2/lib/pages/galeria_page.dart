import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/components/photo_card.dart';
import 'package:ias_generativas_e_ods2/models/photo_model.dart';
import 'package:ias_generativas_e_ods2/repository/photo_repository.dart';

class GaleryPage extends StatefulWidget {
  const GaleryPage({super.key});

  @override
  State<GaleryPage> createState() => _GaleryPageState();
}

class _GaleryPageState extends State<GaleryPage> {
  List<PhotoCard> photoCards = List.generate(
    PhotoRepository().findAll().length,
    (index) {
      List<PhotoModel> photos = PhotoRepository().findAll();
      return PhotoCard(photo: photos[index]);
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Galeria de fotos"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1,
        children: photoCards,
      ),
    );
  }
}
