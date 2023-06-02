import 'package:ias_generativas_e_ods2/models/drone_model.dart';

class DroneRepository {
  List<DroneModel> findAll() {
    return [
      DroneModel(
          id: 01,
          battery: 95,
          status: "Operante",
          coordinates: "19º55’15’’ S e 43º56’16’’ W "),
      DroneModel(
          id: 02,
          battery: 43,
          status: "Operante",
          coordinates: "19º55’15’’ S e 43º56’16’’ W "),
      DroneModel(
          id: 03,
          battery: 10,
          status: "Bateria Fraca",
          coordinates: "19º55’15’’ S e 43º56’16’’ W "),
      DroneModel(
          id: 04,
          battery: 02,
          status: "Recarregando",
          coordinates: "19º55’15’’ S e 43º56’16’’ W "),
    ];
  }
}
