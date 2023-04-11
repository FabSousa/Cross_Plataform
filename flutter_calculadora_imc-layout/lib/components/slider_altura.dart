import 'package:calculadora_imc/constants.dart';
import 'package:flutter/material.dart';

class SliderAltura extends StatelessWidget {
  void Function(double) onChanged;
  int altura;

  SliderAltura({super.key, required this.onChanged, required this.altura});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'ALTURA',
          style: kLabelTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              altura.toString(),
              style: kNumberTextStyle,
            ),
            const Text(
              'cm',
              style: kLabelTextStyle,
            ),
          ],
        ),
        Slider(
          value: altura.toDouble(),
          min: 120,
          max: 220,
          onChanged: onChanged,
        )
      ],
    );
  }
}
