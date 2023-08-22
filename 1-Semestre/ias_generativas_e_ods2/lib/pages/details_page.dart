import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/models/photo_model.dart';
import 'package:ias_generativas_e_ods2/pages/recomendations_page.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  static const routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final photo = ModalRoute.of(context)!.settings.arguments as PhotoModel;
    const backgroundColor = Colors.green;
    const textStyle = TextStyle(color: Colors.white, fontSize: 20);

    photo.deficienciaNutrientes ??= List.empty();
    photo.pragasDoencas ??= List.empty();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalhes"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RecomendationsPage.routeName,
                arguments: photo,
              );
            },
            icon: const Icon(Icons.assignment),
          ),
        ],
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
              title: Row(
                children: [
                  const Text(
                    "Data: ",
                    style: textStyle,
                  ),
                  Text(
                    "${photo.data.day.toString()}/${photo.data.month}/${photo.data.year}",
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: backgroundColor,
            child: ListTile(
              title: Row(
                children: [
                  const Text(
                    "Cultura: ",
                    style: textStyle,
                  ),
                  Text(
                    photo.cultura.name,
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: backgroundColor,
            child: ListTile(
              title: Row(
                children: [
                  const Text(
                    "Nivel de água: ",
                    style: textStyle,
                  ),
                  Text(
                    photo.nivelDeAgua.name,
                    style: textStyle,
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: backgroundColor,
            child: ListTile(
              title: Row(
                children: [
                  const Text(
                    "Nutrienteas em falta: ",
                    style: textStyle,
                  ),
                  Text(photo.deficienciaNutrientes!.length.toString(),
                      style: textStyle),
                ],
              ),
            ),
          ),
          Container(
            color: backgroundColor,
            child: ListTile(
              title: Row(
                children: [
                  const Text(
                    "Pragas e doenças: ",
                    style: textStyle,
                  ),
                  Text(photo.pragasDoencas!.length.toString(),
                      style: textStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
