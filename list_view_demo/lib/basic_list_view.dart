import 'package:flutter/material.dart';

class BasicListView extends StatefulWidget {
  const BasicListView({Key? key}) : super(key: key);

  @override
  State<BasicListView> createState() => _BasicListViewState();
}

class _BasicListViewState extends State<BasicListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basic List View"),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.home),
            title: Text('title 1'),
            subtitle: Text('Subtitle 1'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('title 2'),
            subtitle: Text('Subtitle 2'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('title 3'),
            subtitle: Text('Subtitle 3'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('title 4'),
            subtitle: Text('Subtitle 4'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('title 5'),
            subtitle: Text('Subtitle 5'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('title 6'),
            subtitle: Text('Subtitle 6'),
          ),
          
        ],
      ),
    );
  }
}