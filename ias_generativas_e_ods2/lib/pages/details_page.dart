import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/models/photo_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  static const routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final photo = ModalRoute.of(context)!.settings.arguments as PhotoModel;
    const backgroundColor = Colors.green;
    const textStyle = TextStyle(color: Colors.white, fontSize: 20);

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
              title: photo.deficienciaNutrientes == null ||
                      photo.deficienciaNutrientes!.isEmpty
                  ? const Text(
                      "Sem deficiencia nutrientes",
                      style: textStyle,
                    )
                  : Row(
                      children: [
                        const Text(
                          "Nutrienteas em falta: ",
                          style: textStyle,
                        ),
                        Column(
                          children: List.generate(
                            photo.deficienciaNutrientes!.length,
                            (index) => Text(
                              photo.deficienciaNutrientes![index].name,
                              style: textStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
          Container(
            color: backgroundColor,
            child: ListTile(
              title: photo.pragasDoencas == null || photo.pragasDoencas!.isEmpty
                  ? const Text(
                      "Sem pragas e doenças",
                      style: textStyle,
                    )
                  : Row(
                      children: [
                        const Text(
                          "Pragas e doenças: ",
                          style: textStyle,
                        ),
                        Column(
                          children: List.generate(
                            photo.pragasDoencas!.length,
                            (index) => Text(
                              photo.pragasDoencas![index].name,
                              style: textStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
