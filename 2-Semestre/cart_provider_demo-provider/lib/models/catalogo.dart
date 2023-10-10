class CatalogoModel {
  static List<Item> items = [
    Item(1, 'Nike Blue', 'Nike', '1', 360),
    Item(2, 'Air Max', 'Nike', '2', 500),
    Item(3, 'Max 270', 'Nike', '3', 450),
    Item(4, 'Air Max 270', 'Nike', '4', 600),
    Item(5, 'Run Didas', 'Adidas', '5', 470),
    Item(6, 'Black Runner', 'Adidas', '6', 400),
  ];
}

class Item {
  final int id;
  final String nome;
  final String marca;
  final String imagem;
  final int preco;

  Item(this.id, this.nome, this.marca, this.imagem, this.preco);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}
