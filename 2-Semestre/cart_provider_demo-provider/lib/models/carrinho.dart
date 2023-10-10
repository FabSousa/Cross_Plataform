import 'package:flutter/material.dart';

import 'catalogo.dart';

class CarrinhoModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void add(Item item) {
    _items.add(item);
  }

  void remove(Item item) {
    _items.remove(item);
  }

  int get totalPrice =>
      _items.fold(0, (total, current) => total + current.preco);
}
