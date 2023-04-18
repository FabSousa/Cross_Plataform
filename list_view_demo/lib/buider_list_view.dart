import 'package:flutter/material.dart';

class BuilderListView extends StatefulWidget {
  const BuilderListView({Key? key}) : super(key: key);

  @override
  State<BuilderListView> createState() => _BuilderListViewState();
}

class _BuilderListViewState extends State<BuilderListView> {
  final items = List.generate(30, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView builder'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              items[index],
              style: const TextStyle(fontSize: 25),
            ),
          );
        },
      ),
    );
  }
}
