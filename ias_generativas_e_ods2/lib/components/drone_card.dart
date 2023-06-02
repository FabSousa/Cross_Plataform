import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/models/drone_model.dart';

class Dronecard extends StatelessWidget {
  final DroneModel drone;
  const Dronecard({super.key, required this.drone});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(color: Colors.white, fontSize: 15);

    return Container(
      width: 250,
      color: Colors.black87,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "ID: ${drone.id.toString()}",
            style: textStyle,
          ),
          const Spacer(),
          Text(
            "Status: ${drone.status}",
            style: textStyle,
          ),
          const Spacer(),
          Column(children: [
            Text(
              "Coordenadas: ",
              style: textStyle,
            ),
            Text(
              drone.coordinates,
              style: textStyle,
            ),
          ]),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.battery_3_bar_rounded,
                color: Colors.white,
              ),
              Text(
                "Bateria: ${drone.battery.toString()}%",
                style: textStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
