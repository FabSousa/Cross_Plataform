import 'package:cart_provider_demo/models/catalogo.dart';
import 'package:cart_provider_demo/pages/catalogo/catalogo_item.dart';
import 'package:flutter/material.dart';

import 'catalogo_appbar.dart';

class CatalogoPage extends StatelessWidget {
  const CatalogoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('BUILD: CatalogoPage');

    return Scaffold(
      appBar: CatalogoAppBar(),
      body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: .63,
          padding: const EdgeInsets.all(10),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 10,
          children: CatalogoModel.items.map((Item item) {
            return CatalogoItem(
              item: item,
            );
          }).toList()),
    );
  }
}
