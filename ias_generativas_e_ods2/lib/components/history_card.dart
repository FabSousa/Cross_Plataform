import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/enum/nivel_de_agua.dart';

import '../models/photo_model.dart';
import '../pages/details_page.dart';

class HistoryCard extends StatelessWidget {
  final PhotoModel photo;

  const HistoryCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    const double textSize = 15;
    const TextStyle textStyle = TextStyle(fontSize: textSize);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailsPage.routeName,
          arguments: photo,
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          // color: Colors.lightGreen,
          border: Border(
            right: BorderSide(
              width: 10,
              color: Colors.white,
            ),
          ),
        ),
        margin: const EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: photo.image,
            ),
            SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
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
                  Row(
                    children: [
                      const Text(
                        "Nivel de água: ",
                        style: textStyle,
                      ),
                      Text(
                        photo.nivelDeAgua.name,
                        style: TextStyle(
                            fontSize: textSize,
                            color: photo.nivelDeAgua == NivelDeAgua.excessivo ||
                                    photo.nivelDeAgua == NivelDeAgua.critico
                                ? Colors.red
                                : Colors.green),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Quantidade de nutrientes em deficiência: ",
                        style: textStyle,
                      ),
                      Text(
                        photo.deficienciaNutrientes?.length.toString() ?? "0",
                        style: TextStyle(
                            fontSize: textSize,
                            color: photo.deficienciaNutrientes == null ||
                                    photo.deficienciaNutrientes!.isEmpty
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Quantidade de pragas e doenças: ",
                        style: textStyle,
                      ),
                      Text(
                        photo.pragasDoencas?.length.toString() ?? "0",
                        style: TextStyle(
                            fontSize: textSize,
                            color: photo.pragasDoencas == null ||
                                    photo.pragasDoencas!.isEmpty
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
