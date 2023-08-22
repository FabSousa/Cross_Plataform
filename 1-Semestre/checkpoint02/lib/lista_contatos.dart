import 'package:checkpoint02/contato.dart';
import 'package:flutter/material.dart';

class ListaContatos extends StatefulWidget {
  const ListaContatos({Key? key}) : super(key: key);

  @override
  State<ListaContatos> createState() => _ListaContatosState();
}

class _ListaContatosState extends State<ListaContatos> {
  int favCount = 0;

  List<Contato> contatos = [
    Contato("Jhon Doe", "jhon@doe.com"),
    Contato("Aloce O. Austin", "alice@austin.com"),
    Contato("Douglas P. Broadway", "douglas@broadway.com")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Contatos Favoritos $favCount")),
      body: ListView.builder(
          itemCount: contatos.length,
          itemBuilder: (context, index) {
            Contato contato = contatos[index];
            Icon favIcon = const Icon(Icons.favorite_border);
            Icon favIconPressed = const Icon(Icons.favorite, color: Colors.red);

            return ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=$index'),
              ),
              title: Text(contato.nome),
              subtitle: Text(contato.email),
              trailing: IconButton(
                icon: contato.isFavorite ? favIconPressed : favIcon,
                onPressed: () {
                  setState(() {
                    if (contato.isFavorite) {
                      favCount--;
                      contato.isFavorite = false;
                    } else {
                      favCount++;
                      contato.isFavorite = true;
                    }
                  });
                },
              ),
            );
          }),
    );
  }
}
