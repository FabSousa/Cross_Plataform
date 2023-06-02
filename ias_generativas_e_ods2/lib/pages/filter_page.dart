import 'package:flutter/material.dart';
import 'package:ias_generativas_e_ods2/enum/culturas.dart';
import 'package:ias_generativas_e_ods2/enum/filtros.dart';
import 'package:ias_generativas_e_ods2/enum/nivel_de_agua.dart';
import 'package:ias_generativas_e_ods2/enum/nutrientes.dart';
import 'package:ias_generativas_e_ods2/enum/pragas_doencas.dart';
import 'package:ias_generativas_e_ods2/pages/history_page.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  static const routeName = "/filter";

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    Map<Filtros, Object?> filters = {
      Filtros.cultura: null,
      Filtros.agua: null,
      Filtros.nutrientes: null,
      Filtros.pragas: null,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Filtros"),
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DropdownMenu<Culturas>(
              label: const Text("Cultura"),
              onSelected: (entrie) {
                filters.update(Filtros.cultura, (value) => entrie);
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: Culturas.soja,
                  label: Culturas.soja.name,
                ),
                DropdownMenuEntry(
                  value: Culturas.milho,
                  label: Culturas.milho.name,
                ),
                DropdownMenuEntry(
                  value: Culturas.cafe,
                  label: Culturas.cafe.name,
                ),
                DropdownMenuEntry(
                  value: Culturas.feijao,
                  label: Culturas.feijao.name,
                ),
                DropdownMenuEntry(
                  value: Culturas.arroz,
                  label: Culturas.arroz.name,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DropdownMenu<NivelDeAgua>(
              label: const Text("Nivel de água"),
              onSelected: (entrie) {
                filters.update(Filtros.agua, (value) => entrie);
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: NivelDeAgua.critico,
                  label: Culturas.soja.name,
                ),
                DropdownMenuEntry(
                  value: NivelDeAgua.baixo,
                  label: NivelDeAgua.baixo.name,
                ),
                DropdownMenuEntry(
                  value: NivelDeAgua.medio,
                  label: NivelDeAgua.medio.name,
                ),
                DropdownMenuEntry(
                  value: NivelDeAgua.alto,
                  label: NivelDeAgua.alto.name,
                ),
                DropdownMenuEntry(
                  value: NivelDeAgua.excessivo,
                  label: NivelDeAgua.excessivo.name,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DropdownMenu<Nutrientes>(
              label: const Text("Deficiência de nutrientes"),
              onSelected: (entrie) {
                filters.update(Filtros.nutrientes, (value) => entrie);
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: Nutrientes.calcio,
                  label: Nutrientes.calcio.name,
                ),
                DropdownMenuEntry(
                  value: Nutrientes.enxofre,
                  label: Nutrientes.enxofre.name,
                ),
                DropdownMenuEntry(
                  value: Nutrientes.fosforo,
                  label: Nutrientes.fosforo.name,
                ),
                DropdownMenuEntry(
                  value: Nutrientes.magnesio,
                  label: Nutrientes.magnesio.name,
                ),
                DropdownMenuEntry(
                  value: Nutrientes.nitrogenio,
                  label: Nutrientes.nitrogenio.name,
                ),
                DropdownMenuEntry(
                  value: Nutrientes.potassio,
                  label: Nutrientes.potassio.name,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: DropdownMenu<PragasDoencas>(
              label: const Text("Pragas e doençãs"),
              onSelected: (entrie) {
                filters.update(Filtros.pragas, (value) => entrie);
              },
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: PragasDoencas.bacterias,
                  label: PragasDoencas.bacterias.name,
                ),
                DropdownMenuEntry(
                  value: PragasDoencas.ervasDaninhas,
                  label: PragasDoencas.ervasDaninhas.name,
                ),
                DropdownMenuEntry(
                  value: PragasDoencas.fungos,
                  label: PragasDoencas.fungos.name,
                ),
                DropdownMenuEntry(
                  value: PragasDoencas.lagartas,
                  label: PragasDoencas.lagartas.name,
                ),
                DropdownMenuEntry(
                  value: PragasDoencas.virus,
                  label: PragasDoencas.virus.name,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              HistoryPage.routeName,
              arguments: filters,
            );
          },
          shape: const BeveledRectangleBorder(borderRadius: BorderRadius.zero),
          child: const Text(
            "Confirmar",
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
