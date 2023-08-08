import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _number = 0;
  String _text = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Satteful Widget"),
      ),
      body: Center(
        child: Text("$_text"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: Icon(Icons.add),
      ),
    );
  }

  void _increment() {
    setState(() {
      if (_number < 10){
        _number++;
        _text = _number.toString();
      }
      else
        _text = "O numero não pode ser superior a 10";
    });
  }
}
