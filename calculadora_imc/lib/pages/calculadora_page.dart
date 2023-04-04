import 'package:calculadora_imc/components/icon_content.dart';
import 'package:calculadora_imc/util/constants.dart';
import 'package:flutter/material.dart';
import '../components/custom_card.dart';

class CalculadoraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calcular IMC"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    child: IconContent(
                      icon: Icons.male,
                      text: "Masculino",
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    child: IconContent(
                      icon: Icons.female,
                      text: "Feminino",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CustomCard(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Altura",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        "1.83",
                        style: kNumberTextStyle,
                      ),
                      Text("cm",),
                    ],
                  ),
                  Slider(value: 0, onChanged: (double) {})
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    child: Placeholder(),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    child: Placeholder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
