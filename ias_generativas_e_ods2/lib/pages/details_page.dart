import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/models/photo_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  static const routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final photo = ModalRoute.of(context)!.settings.arguments as PhotoModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
      ),
      body: ListView(
        children: [
          SizedBox(
            width: photo.image.width,
            child: photo.image,
          ),
          ListTile(
            title: Row(
              children: [
                const Text("ID: "),
                Text(photo.id.toString()),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                const Text("Cultura: "),
                Text(photo.cultura.name),
              ],
            ),
          ),
          ListTile(
            title: Row(
              children: [
                const Text("Nivel de água: "),
                Text(photo.nivelDeAgua.name),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
